package cz.jiripinkas.jba.service;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import cz.jiripinkas.jba.entity.SecurityQuestion;
import cz.jiripinkas.jba.entity.User;
import cz.jiripinkas.jba.repository.SecurityQuestionRepository;
import cz.jiripinkas.jba.repository.UserRepository;

@Service
@Transactional
public class SecurityQuestionService {

	private static final Logger logger = Logger
			.getLogger(SecurityQuestionService.class);

	@Autowired
	private SecurityQuestionRepository securityQuestionRepository;

	@Autowired
	private UserRepository userRepository;

	public List<SecurityQuestion> findAll() {
		// TODO Auto-generated method stub
		List<SecurityQuestion> securityQuestion = securityQuestionRepository
				.findAll();
		return securityQuestion;
	}

	public SecurityQuestion findOne(String name) {
		// TODO Auto-generated method stub
		User user = userRepository.findByName(name);

		return user.getSecurityQuestion();
	}

	public List<SecurityQuestion> getTableData(int page) {
		// TODO Auto-generated method stub
		logger.info("inside getTableData service");
		return securityQuestionRepository.findAll(
				new PageRequest(page, 10, Direction.ASC, "id")).getContent();
	}

	public void updateSecurityQuestionTable(SecurityQuestion tmp) {
		// TODO Auto-generated method stub
		logger.info("inside updateFileUploadTable service");

		Integer idtmp = tmp.getId();
		SecurityQuestion question = securityQuestionRepository.findOne(idtmp);
		question.setSecurityQ(tmp.getSecurityQ());
		securityQuestionRepository.save(question);

	}

}
