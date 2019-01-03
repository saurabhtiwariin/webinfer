package cz.jiripinkas.jba.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import cz.jiripinkas.jba.entity.Accept;
import cz.jiripinkas.jba.entity.Commit;
import cz.jiripinkas.jba.entity.Transaction;
import cz.jiripinkas.jba.entity.User;
import cz.jiripinkas.jba.repository.StatusRepository;
import cz.jiripinkas.jba.repository.TransactionRepository;
import cz.jiripinkas.jba.repository.UserRepository;

@Service
@Transactional
public class TransactionService {
	private static final Logger logger = Logger
			.getLogger(TransactionService.class);

	@Autowired
	private TransactionRepository transactionRepository;

	@Autowired
	private StatusRepository statusRepository;

	@Autowired
	private UserRepository userRepository;

	public List<Transaction> findByUser(User user,String remark) {
		// TODO Auto-generated method stub
		List<Transaction> transactions = transactionRepository.findByUser(user,remark);
		return transactions;
	}

	public List<Transaction> getTableData(int page) {
		logger.info("inside getTableData service");
		return transactionRepository.findAll(
				new PageRequest(page, 10, Direction.ASC, "id"))
				.getContent();
	}

	public List<Transaction> getTableData(User user) {
		// TODO Auto-generated method stub
		return transactionRepository.findByUser(user);
	}

	
	public void updateTransactionTable(Transaction tmp) {
		// TODO Auto-generated method stub
		logger.info("inside updateTransactionTable service");

		Integer idtmp = tmp.getId();
		Transaction transaction = transactionRepository.findOne(idtmp);

		transaction.setAmount(tmp.getAmount());
		transaction.setBalAfterTran(tmp.getBalAfterTran());
		transaction.setBalBeforeTran(tmp.getBalBeforeTran());
		transaction.setDateTransaction(tmp.getDateTransaction());
		transaction.setRemark(tmp.getRemark());
		transaction.setUser(tmp.getUser());
		transactionRepository.save(transaction);

	}

	public void entryForCommit(User user, Commit commit, long newBal) {
		// TODO Auto-generated method stub
		Transaction transaction = new Transaction();
		transaction.setAmount(commit.getAmount());
		transaction.setBalBeforeTran(user.getBalance());
		transaction.setBalAfterTran(newBal);
		transaction.setDateTransaction(Calendar.getInstance(TimeZone.getTimeZone("IST")).getTime());
		transaction.setRemark("commit");
		transaction.setUser(user);
		transactionRepository.saveAndFlush(transaction);
		logger.info("Entry made to transaction table with for user"+user.getName());
	}

	public void entryForAccept(User user, Accept accept, long newBal) {
		// TODO Auto-generated method stub
		Transaction transaction = new Transaction();
		transaction.setAmount(accept.getAmount());
		transaction.setBalBeforeTran(user.getBalance());
		transaction.setBalAfterTran(newBal);
		transaction.setDateTransaction(Calendar.getInstance(TimeZone.getTimeZone("IST")).getTime());
		transaction.setRemark("accept");
		transaction.setUser(user);
		transactionRepository.saveAndFlush(transaction);
		logger.info("Entry made to transaction table with for user="+user.getName());
		
	}

	public void entryForDirectIncome(User commitUser,User sponser, long bal, long newBal) {
		// TODO Auto-generated method stub
		Transaction transaction = new Transaction();
		transaction.setBalBeforeTran(bal);
		transaction.setBalAfterTran(newBal);
		transaction.setDateTransaction(Calendar.getInstance(TimeZone.getTimeZone("IST")).getTime());
		transaction.setRemark("directIncome");
		transaction.setUser(sponser);
		transactionRepository.saveAndFlush(transaction);
		logger.info("Entry made to transaction table with for user="+sponser.getName());
		
	}

	public List<Transaction> findAll() {
		// TODO Auto-generated method stub
		return transactionRepository.findAll();
	}


	/*
	 * public void saveByCommit(Commit commit, User user) { // TODO
	 * Auto-generated method stub Transaction transaction = new Transaction();
	 * transaction.setCommit(commit);
	 * 
	 * transaction.setAmount(user.getBalance());
	 * transaction.setAfterTransactionAmount
	 * (commit.getAmount()+user.getBalance());
	 * transaction.setBankDetails(user.getBankDetails());
	 * transaction.setDateTransaction(new Date(System.currentTimeMillis()));
	 * transaction.setStatus(statusRepository.findOne(9));
	 * transaction.setUser(user);
	 * 
	 * transactionRepository.save(transaction); }
	 */
}
