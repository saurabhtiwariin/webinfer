package cz.jiripinkas.jba.service;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import cz.jiripinkas.jba.entity.OTP;
import cz.jiripinkas.jba.repository.OTPRepository;

@Service
@Transactional
public class OTPService {
	private static final Logger logger = Logger.getLogger(OTPService.class);

	@Autowired
	private OTPRepository otpRepository;

	public List<OTP> findAllPagination(int page) {
		// TODO Auto-generated method stub
		return otpRepository.findAll(
				new PageRequest(page, 10, Direction.ASC, "id")).getContent();

	}

	public void updateOTPTable(OTP otptmp) {
		// TODO Auto-generated method stub
		logger.info("inside updateOTPTable service");

		Integer idtmp = otptmp.getId();
		OTP otp = otpRepository.findOne(idtmp);

		otp.setOtp(otptmp.getOtp());
		otp.setExpiryDate(otptmp.getExpiryDate());
		otp.setVerified(otptmp.isVerified());
		otpRepository.save(otp);

	}

	public List<OTP> findAll() {
		// TODO Auto-generated method stub
		return otpRepository.findAll();
	}



}
