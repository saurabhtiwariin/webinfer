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
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import cz.jiripinkas.jba.entity.Accept;
import cz.jiripinkas.jba.entity.Commit;
import cz.jiripinkas.jba.entity.Status;
import cz.jiripinkas.jba.entity.User;
import cz.jiripinkas.jba.repository.CommitRepository;
import cz.jiripinkas.jba.repository.StatusRepository;
import cz.jiripinkas.jba.repository.UserRepository;

@Service
@Transactional
public class CommitService {

	private static final Logger logger = Logger.getLogger(CommitService.class);

	@Autowired
	private CommitRepository commitRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private AcceptService acceptService;

	@Autowired
	private UserService userService;

	@Autowired
	private TransactionService transactionService;

	@Autowired
	private StatusRepository statusRepository;

	/* saving the commit */
	@Transactional
	public boolean save(Commit commit, String name) {
		// getting user
		User user = userRepository.findByName(name);
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("IST"));
		commit.setDateCommit(cal.getTime());
		commit.setUser(user);

		// we will not set status to awaiting submission
		commit.setStatus(statusRepository.findByName("SAVED"));
		commit.setOriginalAmount(commit.getAmount());

		if (commitRepository.saveAndFlush(commit) != null) {
			/* make an entry in transaction table for this commit */
			long newBal = user.getBalance() + commit.getAmount() / 10;
			transactionService.entryForCommit(user, commit, newBal);

			/* saving user with increased balance */
			user.setBalance(newBal);
			userRepository.save(user);
			return true;
		}
		return false;

		/*
		 * User user = userRepository.findByName(name); int commitParentId =
		 * saveCommitParent(commit, user); if (commitParentId == -1) { return
		 * false; }
		 * 
		 * Commit c1; Commit c2; Commit c3; Commit c4;
		 * 
		 * long tmpAmt = commit.getAmount(); Date tmpDate = new
		 * Date(System.currentTimeMillis());
		 * 
		 * if (tmpAmt >= 2000) {
		 * 
		 * long[] checks = Get4Checks.generateFrom(tmpAmt);
		 * 
		 * c1 = new Commit(checks[0], tmpDate, user,
		 * statusRepository.findOne(1),
		 * commitParentRepository.getOne(commitParentId)); mySaveAndFlush(c1,
		 * user); c2 = new Commit(checks[1], tmpDate, user,
		 * statusRepository.findOne(1),
		 * commitParentRepository.getOne(commitParentId)); mySaveAndFlush(c2,
		 * user); c3 = new Commit(checks[2], tmpDate, user,
		 * statusRepository.findOne(1),
		 * commitParentRepository.getOne(commitParentId)); mySaveAndFlush(c3,
		 * user); c4 = new Commit(checks[3], tmpDate, user,
		 * statusRepository.findOne(1),
		 * commitParentRepository.getOne(commitParentId)); mySaveAndFlush(c4,
		 * user); return true; } else { c1 = new Commit(tmpAmt, tmpDate, user,
		 * statusRepository.findOne(1),
		 * commitParentRepository.getOne(commitParentId)); mySaveAndFlush(c1,
		 * user); return true; }
		 */}

	/*
	 * private void mySaveAndFlush(Commit c1, User user) { // TODO
	 * Auto-generated method stub if (commitRepository.saveAndFlush(c1) != null)
	 * { make an entry in transaction table for this commit long newBal =
	 * user.getBalance() + c1.getAmount() / 10;
	 * transactionService.entryForCommit(user, c1, newBal);
	 * 
	 * saving user with increased balance user.setBalance(newBal);
	 * userRepository.save(user); }
	 * 
	 * }
	 */

	public List<Commit> getTableData(int page) {
		// TODO Auto-generated method stub
		return commitRepository.findAll(
				new PageRequest(page, 10, Sort.Direction.ASC, "user")).getContent();
	}

	public void updateCommitTable(Commit tmp) {
		// TODO Auto-generated method stub
		logger.info("inside updateCommitTable service");
		Integer idtmp = tmp.getId();
		Commit commit = commitRepository.findOne(idtmp);
		commit.setAmount(tmp.getAmount());
		commit.setDateCommit(tmp.getDateCommit());
		commit.setDateConf(tmp.getDateConf());
		commit.setStatus(tmp.getStatus());
		commit.setUser(tmp.getUser());
		commit.setDateChequeUploaded(tmp.getDateChequeUploaded());
		commit.setOriginalAmount(tmp.getOriginalAmount());
		commit.setLifeTimestamp(tmp.getLifeTimestamp());
		commit.setDateLinked(tmp.getDateLinked());
		
		/*
		 * apart from this updating accept table also links Accept----Commit
		 */
		
		if (tmp.getAccept().getId() != null) {
			linkCommitToAccept(commit,tmp);
		}
			commitRepository.saveAndFlush(commit);
	}

	private void linkCommitToAccept(Commit commit, Commit tmp) {
		// TODO Auto-generated method stub
		commit.setStatus(statusRepository.findByName("AWAITING_SUBMISSION"));
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("IST"));
		long tmplifeTimestamp = cal.getTime().getTime()
				+ (48 * 60 * 60 * 1000);
		commit.setLifeTimestamp(new Date(tmplifeTimestamp));
		commit.setDateLinked(cal.getTime());
		Accept accept = acceptService.findOne(tmp.getAccept().getId());
		accept.setBorn("");
		commit.setAccept(accept);
		acceptService.save(accept);	
	}

	public void setChequeUploadDate(Commit commit) {
		// TODO Auto-generated method stub
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("IST"));
		commit.setDateChequeUploaded(cal.getTime());
		commitRepository.save(commit);
	}

	public void setConfDate(Commit commit, Date date) {
		// TODO Auto-generated method stub
		commit.setDateConf(date);
		commitRepository.save(commit);
	}

	public void setStatus(Commit commit, int status) {
		// TODO Auto-generated method stub
		logger.info("Inside SetStatusCommit()");
		commit.setStatus(statusRepository.findOne(status));
		commitRepository.save(commit);
		logger.info("Outside SetStatusCommit()");
	}

	@Transactional
	public User getAllCommitments(User user) {
		// getting all commitments from Commit table and setting it in user
		// object
		List<Commit> commits = commitRepository.findByUser(user);
		user.setCommits(commits);
		return user;
	}

	@Transactional
	public List<Commit> getAllCompletedCommitments(User user) {
		// TODO Auto-generated method stub
		List<Commit> completedCommits = new ArrayList<Commit>();

		User u = getAllCommitments(user);
		logger.info("user in getAllCompletedCommitments 1 = " + u.getId());
		logger.info("No of completed commits are 2 " + u.getCommits().size());
		List<Commit> commits = u.getCommits();
		logger.info("No of completed commits are 3" + commits.size());
		if (commits.size() != 0) {
			for (Commit commit : commits) {
				if (commit.getStatus().getId() == statusRepository.findOne(3)
						.getId()) {
					completedCommits.add(commit);
				}
			}
		}
		logger.info("No of completed commits are " + completedCommits.size());
		return completedCommits;

	}

	public boolean allCommitsShouldNotBeAcceptedExceptFirstCommit(User user) {
		// TODO Auto-generated method stub
		int allCommitsSize = getAllCommitments(user).getCommits().size();
		logger.info("All commit size = " + allCommitsSize);
		int allCompletedCommitsSize = getAllCompletedCommitments(user).size();
		logger.info("All completed commit size = " + allCompletedCommitsSize);
		if (allCommitsSize == 0 || allCommitsSize == allCompletedCommitsSize) {
			return false;
		}
		return true;
	}

	/*
	 * public boolean allCommitsShouldBeAcceptedExceptFirstCommitForCommit( User
	 * user) { // TODO Auto-generated method stub int allCommitsSize =
	 * getAllCommitments(user).getCommits().size(); int allCompletedCommitsSize
	 * = getAllCompletedCommitments(user).size();
	 * 
	 * if (allCommitsSize == 0 || allCommitsSize == allCompletedCommitsSize) {
	 * return false; } return true; }
	 */

	public List<Commit> findByUser(User commitor) {
		/*
		 * return all commit from commior
		 */
		return commitRepository.findByUser(commitor);
	}

	public List<Commit> findAll() {
		// TODO Auto-generated method stub
/*		return commitRepository.findAll(new Sort(Sort.Direction.ASC,"user_id"));
*/		return commitRepository.findAllByOrderByUserAsc();

	}

	/*

findAllByOrderByIdAsc();

	 * public void setPercentCompleted(Commit commit) { // TODO Auto-generated
	 * method stub CommitParent commitParent= commit.getCommitParent(); long pc
	 * = commitParent.getPercentCompleted(); pc=pc+25;
	 * commitParent.setPercentCompleted(pc); if (pc==100) {
	 * commitParent.setStatus(statusRepository.findByName("ACCEPTED")); }
	 * commitParentRepository.saveAndFlush(commitParent); }
	 */
	public List<Commit> findByUserAndStatus(User commitor, Status status) {
		// TODO Auto-generated method stub
		return commitRepository.findByUserAndStatus(commitor, status);
	}

	public List<Commit> findByAccept(Accept accept) {
		// TODO Auto-generated method stub
		return commitRepository.findByAccept(accept);
	}

	public boolean acceptPayment(Integer commitId) {
		// TODO Auto-generated method stub
		logger.info("Inside acceptPayment()");
		Commit commit = findOne(commitId);

		if (commit == null
				|| commit.getStatus().getId() == statusRepository.findByName(
						"SAVED").getId() || commit.getStatus().getId() == statusRepository.findByName(
						"AWAITING_SUBMISSION").getId()) {
			return false;
		}

		if ((commit.getStatus()).getId() == statusRepository.findByName(
				"SUBMITTED").getId()) {
			logger.info("Inside acceptPayment() if");
			setStatus(commit, statusRepository.findByName("ACCEPTED").getId());
			setConfDate(commit,Calendar.getInstance(TimeZone.getTimeZone("IST")).getTime());
			Accept accept=commit.getAccept();
			if (allCommitsRelatedToAcceptAreAccepted(accept)) {
				acceptService.setConfDate(accept, Calendar.getInstance(TimeZone.getTimeZone("IST")).getTime());
				acceptService.setStatus(accept, statusRepository.findByName("ACCEPTED"));
			}
			
			User commitUser = commit.getUser();
			User sponser = userService.findOne(commitUser.getSponser().getId());
			if (sponser != null) {
				userService.giveReferralBonusAndPersist(commitUser, sponser,
						commit.getAmount());
			}
			return true;
		} else {
			return false;
		}

	}

	private boolean allCommitsRelatedToAcceptAreAccepted(Accept accept) {
		// TODO Auto-generated method stub
		List<Commit> commits = commitRepository.findByAccept(accept);
		for (Commit commit : commits) {
			if (commit.getStatus().getName()!=statusRepository.findByName("ACCEPTED").getName()) {
				return false;
			}
		}
		return true;
	}

	public Commit findOne(Integer commitId) {
		// TODO Auto-generated method stub
		return commitRepository.findOne(commitId);
	}

	public List<Commit> giveHelpData(User user) {
		/*
		 * returns all incomplete accepts from logged in user and displays in
		 * 2nd column
		 */

		List<Commit> commits = new ArrayList<Commit>();

		for (Commit commit : findByUser(user)) {
			if (commit.getStatus().getId() != statusRepository.findByName(
					"ACCEPTED").getId()) {
				commits.add(commit);
			}
		}
		logger.info("GiveHelp(Left Col) commits size = " + commits.size());
		return commits;
	}

	public List<Commit> giveHelpDataCompleted(User commitor) {
		// TODO Auto-generated method stub
		/*
		 * returns all completed accepts from logged in user 2nd column
		 */

		List<Commit> commits = new ArrayList<Commit>();

		for (Commit commit : findByUserAndStatus(commitor,
				statusRepository.findByName("ACCEPTED"))) {
			commits.add(commit);
		}
		logger.info("GiveHelp(Left Col) commits size = " + commits.size());
		return commits;
	}

	public List<Commit> getHelpData(User acceptor) {
		/*
		 * return all incomplete accepts of this user 3rd column
		 */

		List<Commit> commits = new ArrayList<Commit>();
		for (Accept accept : acceptService.getAllAccepts(acceptor).getAccepts()) {
			for (Commit commit : findByAccept(accept)) {
				if (commit.getStatus().getId() != statusRepository.findByName(
						"ACCEPTED").getId()) {
					commits.add(commit);
				}
			}
		}
		logger.info("GetHelp(Right 3rd Col) commits size = " + commits.size());
		return commits;
	}

	public List<Commit> getHelpDataCompleted(User acceptor) {
		/*
		 * returns all completed accepts from this user 4th column
		 */

		List<Commit> commits = new ArrayList<Commit>();
		for (Accept accept : acceptService.getAllAccepts(acceptor).getAccepts()) {
			for (Commit commit : findByAccept(accept)) {
				if (commit.getStatus().getId() == statusRepository.findByName(
						"ACCEPTED").getId()) {
					commits.add(commit);
				}
			}

		}
		logger.info("GetHelp(Right 4rd Col) commits size = " + commits.size());
		return commits;
	}

	public void addNewCommit(Integer commitId) {
		// TODO Auto-generated method stub
		Commit tmp = findOne(commitId);
		Commit commit = new Commit(0, tmp.getDateCommit(), tmp.getUser(),
				tmp.getStatus(),tmp.getId());
		commit.setOriginalAmount(tmp.getOriginalAmount());
		commitRepository.saveAndFlush(commit);
	}

	public void deleteCommit(Integer commitId) {
		// TODO Auto-generated method stub
		/*
		 * reducing the increased balance of the user after deleting
		 */
		Commit commit = findOne(commitId);
		User user = commit.getUser();
		long amt = commit.getAmount()/10;
		user.setBalance(user.getBalance()-amt);
		userRepository.saveAndFlush(user);
	
		commitRepository.delete(commitId);
		
	}

	public void setLifeTimestamp36HoursBack(Commit tmp) {
		// TODO Auto-generated method stub
		long tmpTime=tmp.getLifeTimestamp().getTime()
				- (48 * 60 * 60 * 1000);
		tmp.setLifeTimestamp(new Date(tmpTime));
		commitRepository.saveAndFlush(tmp);
	}
}
