package cz.jiripinkas.jba.service;

import java.security.Principal;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import cz.jiripinkas.jba.entity.BankDetails;
import cz.jiripinkas.jba.entity.User;
import cz.jiripinkas.jba.repository.BankDetailsRepository;
import cz.jiripinkas.jba.repository.UserRepository;

@Service
@Transactional
public class BankDetailsService {
	private static final Logger logger = Logger
			.getLogger(BankDetailsService.class);

	@Autowired
	private BankDetailsRepository bankDetailsRepository;

	@Autowired
	private UserService userService;

	@Autowired
	private UserRepository userRepository;

	public void save(BankDetails bankDetails, Principal principal) {
		// TODO Auto-generated method stub
		User user = userService.getUser(principal);
		BankDetails oldBankDetails = user.getBankDetails();
		if (oldBankDetails != null) {
			logger.info("In if loop");
			logger.info(bankDetails.getId());
			oldBankDetails.setBankName(bankDetails.getBankName());
			oldBankDetails.setBankBranch(bankDetails.getBankBranch());
			oldBankDetails.setAccountNo(bankDetails.getAccountNo());
			oldBankDetails.setBankIFSC(bankDetails.getBankIFSC());
			oldBankDetails.setAccountType(bankDetails.getAccountType());
			oldBankDetails.setCardNo(bankDetails.getCardNo());
			oldBankDetails.setAccountHolderName(bankDetails
					.getAccountHolderName());
			bankDetailsRepository.save(oldBankDetails);
		} else {
			logger.info("In else loop ---------------"
					+ bankDetails.getBankName());
			BankDetails newbankDetails = new BankDetails();
			newbankDetails = bankDetails;
			newbankDetails.setUser(user);
			bankDetailsRepository.save(newbankDetails);
		}

	}

	public List<BankDetails> getTableData(int page) {
		// TODO Auto-generated method stub
		return bankDetailsRepository.findAll(
				new PageRequest(page, 10, Direction.ASC, "id")).getContent();
	}

	public void updateBankDetailsTable(BankDetails tmp) {
		logger.info("inside updateBankDetailsTable service");

		Integer idtmp = tmp.getId();
		BankDetails bankDetails = bankDetailsRepository.findOne(idtmp);
		bankDetails.setAccountNo(tmp.getAccountNo());
		bankDetails.setAccountType(tmp.getAccountType());
		bankDetails.setAccountHolderName(tmp.getAccountHolderName());
		bankDetails.setCardNo(tmp.getCardNo());
		bankDetails.setBankName(tmp.getBankName());
		bankDetails.setBankBranch(tmp.getBankBranch());
		bankDetails.setBankIFSC(tmp.getBankIFSC());
		bankDetails.setUser(tmp.getUser());

		bankDetailsRepository.save(bankDetails);

	}

	public List<BankDetails> findAll() {
		// TODO Auto-generated method stub
		return bankDetailsRepository.findAll();
	}

}
