package cz.jiripinkas.jba.service;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import cz.jiripinkas.jba.entity.PasswordResetToken;
import cz.jiripinkas.jba.repository.PasswordResetTokenRepository;

@Service
@Transactional
public class PasswordResetTokenService {
	private static final Logger logger = Logger
			.getLogger(PasswordResetTokenService.class);

	@Autowired
	private PasswordResetTokenRepository passwordResetTokenRepository;


	public List<PasswordResetToken> getTableData(int page) {
		logger.info("inside PasswordResetToken service");
		return passwordResetTokenRepository.findAll(
				new PageRequest(page, 10, Direction.ASC, "id"))
				.getContent();
	}


	public void updatePasswordResetTokenTable(PasswordResetToken tmp) {
		// TODO Auto-generated method stub
		logger.info("inside updatepasswordResetTokenTable service");

		Integer idtmp = tmp.getId();
		PasswordResetToken passwordResetToken = passwordResetTokenRepository.findOne(idtmp);

		passwordResetToken.setToken(tmp.getToken());
		passwordResetToken.setExpiryDate(tmp.getExpiryDate());
		passwordResetToken.setUser(tmp.getUser());
		passwordResetTokenRepository.save(passwordResetToken);
		
	}


	public List<PasswordResetToken> findAll() {
		// TODO Auto-generated method stub
		return passwordResetTokenRepository.findAll();
	}

}
