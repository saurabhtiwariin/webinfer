package cz.jiripinkas.jba.service;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cz.jiripinkas.jba.entity.OTP;
import cz.jiripinkas.jba.entity.SecurityQuestion;
import cz.jiripinkas.jba.entity.User;
import cz.jiripinkas.jba.repository.OTPRepository;
import cz.jiripinkas.jba.repository.SecurityQuestionRepository;
import cz.jiripinkas.jba.repository.UserRepository;

@Service
@Transactional
public class SmsService {
	private static final Logger logger = Logger.getLogger(SmsService.class);

	@Autowired
	private SecurityQuestionRepository securityQuestionRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private OTPRepository otpRepository;

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

	/*
	 * public static void main(String[] args) { try { String number =
	 * "919044228308"; String message = "I luv very much my okie.."; String
	 * username = "919087099298"; String password = "160F";
	 * 
	 * String requestUrl = "http://www.smszone.in/sendsms.asp?page=SendSmsBulk&"
	 * + "username=" + URLEncoder.encode(username, "UTF-8") + "&password=" +
	 * URLEncoder.encode(password, "UTF-8") + "&number=" +
	 * URLEncoder.encode(number, "UTF-8") + "&message=" +
	 * URLEncoder.encode(message, "UTF-8");
	 * 
	 * URL url = new URL(requestUrl); HttpURLConnection uc = (HttpURLConnection)
	 * url.openConnection();
	 * 
	 * System.out.println(uc.getResponseMessage());
	 * 
	 * uc.disconnect();
	 * 
	 * } catch (Exception ex) { System.out.println(ex.getMessage());
	 * 
	 * }
	 * 
	 * }
	 */
	public String getNewOTP() {
		// TODO Auto-generated method stub
		String otp = "";
		for (int i = 0; i < 6; i++) {
			int j = (int) Math.floor(Math.random() * 10);
			otp += j;
		}

		return otp;
	}

	public void sendOTPAndPersist(String mobNo, String otp) {
		// TODO Auto-generated method stub
		logger.error("sendOTPAndPersist - 1");
		OTP o = new OTP(otp);
		logger.error("sendOTPAndPersist - 2"+o.getOtp());
		otpRepository.save(o);
		logger.error("sendOTPAndPersist - 3 - after save");
		sendOTP(mobNo, otp);
	}

	private void sendOTP(String mobNo, String otp) {
		// TODO Auto-generated method stub
		try {
			String number = mobNo;
			String message = "Your OTP for registration is " + otp;
			String username = "919087099298";
			String password = "160F";

			String requestUrl = "http://www.smszone.in/sendsms.asp?page=SendSmsBulk&"
					+ "username="
					+ URLEncoder.encode(username, "UTF-8")
					+ "&password="
					+ URLEncoder.encode(password, "UTF-8")
					+ "&number="
					+ URLEncoder.encode(number, "UTF-8")
					+ "&message=" + URLEncoder.encode(message, "UTF-8");

			URL url = new URL(requestUrl);
			logger.error("sendOTP - 1 - "+url);
			HttpURLConnection uc = (HttpURLConnection) url.openConnection();
			logger.error("sendOTP - 5 - ResponseMessage - "+uc.getResponseMessage());

			uc.disconnect();

		} catch (Exception ex) {
			logger.error("sendOTP Exception"+ex.getMessage());
		}

	}

	public OTP findByOTP(String otp) {
		// TODO Auto-generated method stub
		return otpRepository.findByOtp(otp);

	}

	public String verifyOTP(String otp) {
		// TODO Auto-generated method stub
		Boolean res = false;
		logger.error("verifyOTP - 1 - inside");
		OTP o = findByOTP(otp);
		logger.error("verifyOTP - 2 - "+o.getOtp()+" verified="+ o.isVerified());
		if (o != null) {
			o.setVerified(true);
			otpRepository.save(o);
			res = true;
		} else {
			res = false;
		}
		logger.error("verifyOTP - 3 result="+ res.toString());
		return res.toString();
	}

}
