package cz.jiripinkas.jba.service;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import cz.jiripinkas.jba.entity.VerificationToken;
import cz.jiripinkas.jba.repository.VerificationTokenRepository;

@Service
@Transactional
public class VerificationTokenService {
	private static final Logger logger = Logger
			.getLogger(VerificationTokenService.class);

	@Autowired
	private VerificationTokenRepository verificationTokenRepository;


	public List<VerificationToken> getTableData(int page) {
		logger.info("inside verificationToken service");
		return verificationTokenRepository.findAll(
				new PageRequest(page, 10, Direction.ASC, "id"))
				.getContent();
	}


	public void updateVerificationTokenTable(VerificationToken tmp) {
		// TODO Auto-generated method stub
		logger.info("inside updateVerificationTokenTable service");

		Integer idtmp = tmp.getId();
		VerificationToken verificationToken = verificationTokenRepository.findOne(idtmp);

		verificationToken.setToken(tmp.getToken());
		verificationToken.setExpiryDate(tmp.getExpiryDate());
		verificationToken.setUser(tmp.getUser());
		verificationToken.setVerified(tmp.isVerified());
		verificationTokenRepository.save(verificationToken);
			
	}


	public List<VerificationToken> findAll() {
		// TODO Auto-generated method stub
		return verificationTokenRepository.findAll();
	}

}
