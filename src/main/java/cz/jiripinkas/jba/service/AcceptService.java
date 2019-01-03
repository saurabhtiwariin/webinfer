package cz.jiripinkas.jba.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import cz.jiripinkas.jba.entity.Accept;
import cz.jiripinkas.jba.entity.Commit;
import cz.jiripinkas.jba.entity.Role;
import cz.jiripinkas.jba.entity.Status;
import cz.jiripinkas.jba.entity.User;
import cz.jiripinkas.jba.repository.AcceptRepository;
import cz.jiripinkas.jba.repository.CommitRepository;
import cz.jiripinkas.jba.repository.RoleRepository;
import cz.jiripinkas.jba.repository.StatusRepository;
import cz.jiripinkas.jba.repository.UserRepository;

@Service
@Transactional
public class AcceptService {

	private static final Logger logger = Logger.getLogger(AcceptService.class);

	@Autowired
	private StatusRepository statusRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private AcceptRepository acceptRepository;

	@Autowired
	private CommitRepository commitRepository;

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private RoleService roleService;
	
	@Autowired
	private CommitService commitService;

	@Autowired
	private UserService userService;

	@Autowired
	private TransactionService transactionService;

	public boolean save(Accept accept, User user) {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("IST"));
		accept.setReqDate(cal.getTime());
		accept.setUser(user);
		accept.setStatus(statusRepository.findByName("SAVED"));
		accept.setOriginalAmount(accept.getAmount());
		accept.setBorn("new");
		
		if (acceptRepository.saveAndFlush(accept) != null) {
			/* make an entry in transaction table for this accept */
			long newBal = user.getBalance() - accept.getAmount();
			transactionService.entryForAccept(user, accept, newBal);

			/* saving user with new balance */
			user.setBalance(newBal);
			userRepository.save(user);
			return true;
		}
		return false;
	}

	/*
	 * private void mySaveAndFlush(Accept a1, User user) { // TODO
	 * Auto-generated method stub if (acceptRepository.saveAndFlush(a1) != null)
	 * { make an entry in transaction table for this commit long newBal =
	 * user.getBalance() - a1.getAmount();
	 * transactionService.entryForAccept(user, a1, newBal);
	 * 
	 * saving user with increased balance user.setBalance(newBal);
	 * userRepository.save(user); }
	 * 
	 * }
	 */



	public List<Accept> getTableData(int page) {
		// TODO Auto-generated method stub
		logger.info("inside getTableData service");
		return acceptRepository.findAll(
				new PageRequest(page, 10, Sort.Direction.ASC, "user")).getContent();
	}

	public void updateAcceptTable(Accept tmp) {
		// TODO Auto-generated method stub
		logger.info("inside updateAcceptTable service");

		Integer idtmp = tmp.getId();
		Accept accept = acceptRepository.findOne(idtmp);
		accept.setAmount(tmp.getAmount());
		accept.setConfDate(tmp.getConfDate());
		accept.setReqDate(tmp.getReqDate());
		accept.setCommits(tmp.getCommits());
		accept.setStatus(tmp.getStatus());
		accept.setUser(tmp.getUser());

		if (acceptRepository.save(accept) != null) {
			Accept acceptParent = acceptRepository.findOne(tmp.getParentId());
			acceptParent.setAmount(acceptParent.getAmount()-accept.getAmount());
			acceptRepository.save(acceptParent);
		}
		
	}

	public void setStatus(Accept accept, Status status) {
		// TODO Auto-generated method stub
		logger.info("Inside setStatus()");
		accept.setStatus(status);
		acceptRepository.save(accept);
		logger.info("Outside setStatus()");
	}

	public void setConfDate(Accept accept, Date date) {
		// TODO Auto-generated method stub
		logger.info("Inside setconf date accept()");
		accept.setConfDate(date);
		acceptRepository.save(accept);
		logger.info("outside setconf date accept()");
	}

	public Accept findOne(Integer acceptId) {
		// TODO Auto-generated method stub
		try {
			return acceptRepository.findOne(acceptId);
		} catch (Exception e) {
			return null;
		}

	}

	/*
	 * @Transactional public User getAllAccepts(User user) { // TODO
	 * Auto-generated method stub List<Commit> commits =
	 * acceptRepository.findByUser(user); user.setCommits(commits); return user;
	 * }
	 */

/*	private void setPercentCompleted(Accept accept) {
		// TODO Auto-generated method stub
		AcceptParent acceptParent = accept.getAcceptParent();
		long pc = acceptParent.getPercentCompleted();
		pc = pc + 25;
		acceptParent.setPercentCompleted(pc);
		if (pc == 100) {
			acceptParent.setStatus(statusRepository.findByName("ACCEPTED"));
		}
		acceptParentRepository.saveAndFlush(acceptParent);
	}*/

	public User getAllAccepts(User user) {
		// TODO Auto-generated method stub
		List<Accept> accepts = acceptRepository.findByUser(user);
		user.setAccepts(accepts);
		return user;
	}

	public boolean tenDayCheck(User user) {

		// if false dont perform this check
		if (user.getLife() <= 10) {
			return false;
		}

		long sumOfAllCommits = 0;
		List<Commit> commits = commitService.getAllCommitments(user)
				.getCommits();
		for (Commit commit : commits) {
			sumOfAllCommits += commit.getAmount();
		}
		logger.info("sumOfAllCommits = " + sumOfAllCommits);

		long sumOfAllAccepts = 0;
		List<Accept> accepts = getAllAccepts(user).getAccepts();
		for (Accept accept : accepts) {
			sumOfAllAccepts += accept.getAmount();
		}
		logger.info("sumOfAllAccepts" + sumOfAllAccepts);

		if (sumOfAllAccepts >= sumOfAllCommits) {
			return true;
		}
		return false;
	}


	public boolean allAcceptsShouldNotBeAcceptedExceptFirstAccept(User user) {
		// TODO Auto-generated method stub

		int allAcceptsSize = getAllAccepts(user).getAccepts().size();
		logger.info("All accept size = " + allAcceptsSize);
		
		int allCompletedAcceptsSize = getAllCompletedAccepts(user).size();
		logger.info("All completed accept size = " + allCompletedAcceptsSize);
		
		int allSavedAcceptsSize = getAllSavedAccepts(user).size();
		logger.info("All Saved accept size = " + allSavedAcceptsSize);
		
		if (allAcceptsSize == 0 || allAcceptsSize == allSavedAcceptsSize || allAcceptsSize == allCompletedAcceptsSize) {
		
			Role roleAdmin = roleRepository.findByName("ROLE_ADMIN");
			List<Role> currentRoles = userService.findRoles(user);
			
			if (currentRoles.contains(roleAdmin)) {
				return false;
			}
			if(commitService.findByUserAndStatus(user, statusRepository.findByName("ACCEPTED")).size()==commitService.findByUser(user).size()){
				return false;
			}else{
				return true;	
			}
			
		}
		return true;
	}

	private List<Accept> getAllSavedAccepts(User user) {
		// TODO Auto-generated method stub
		return getAllByUserAndStatus(user,statusRepository.findByName("SAVED"));
	}

	private List<Accept> getAllByUserAndStatus(User user, Status status) {
		// TODO Auto-generated method stub
		return acceptRepository.findByUserAndStatus(user, status);
	}

	@Transactional
	public List<Accept> getAllCompletedAccepts(User user) {
		// returning this from CommitParentRepository
		Status status = statusRepository.findByName("ACCEPTED");
		return acceptRepository.findByUserAndStatus(user, status);
	}

	public List<Accept> findAll() {
		// TODO Auto-generated method stub
		return acceptRepository.findAll(new Sort(Sort.Direction.ASC,"user"));
	}

	public boolean allCommitsShouldNotBeAcceptedExceptFirstCommitForAccept(
			User user) {
		// TODO Auto-generated method stub
	
		int allCommitsSize = commitService.getAllCommitments(user).getCommits().size();
		logger.info("All commit size = " + allCommitsSize);
		
		int allCompletedCommitsSize = commitService
				.getAllCompletedCommitments(user).size();
		logger.info("All completed commit size = " + allCompletedCommitsSize);
		
		int allSaveCommitsSize = commitService
				.findByUserAndStatus(user,statusRepository.findByName("SAVED")).size();
		logger.info("All saved commit size = " + allSaveCommitsSize);
		
		if (allCommitsSize == 1 || allCommitsSize == allSaveCommitsSize || allCommitsSize == allCompletedCommitsSize) {
			return false;
		}
		return true;
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		acceptRepository.delete(id);
	}

	public void addNewAccept(int id) {
		// TODO Auto-generated method stub
		Accept tmp = findOne(id);
		Accept accept = new Accept(0, tmp.getOriginalAmount(), tmp.getReqDate(), tmp.getConfDate(), tmp.getUser(), tmp.getBorn(), tmp.getStatus(),tmp.getId());
		accept.setBorn(tmp.getBorn());
		acceptRepository.saveAndFlush(accept);
	}

	public void save(Accept accept) {
		// TODO Auto-generated method stub
		acceptRepository.saveAndFlush(accept);
	}

}
