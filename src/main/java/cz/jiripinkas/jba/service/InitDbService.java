package cz.jiripinkas.jba.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import cz.jiripinkas.jba.entity.Role;
import cz.jiripinkas.jba.entity.SecurityQuestion;
import cz.jiripinkas.jba.entity.Status;
import cz.jiripinkas.jba.entity.User;
import cz.jiripinkas.jba.repository.AcceptRepository;
import cz.jiripinkas.jba.repository.CommitRepository;
import cz.jiripinkas.jba.repository.ComplaintRepository;
import cz.jiripinkas.jba.repository.RoleRepository;
import cz.jiripinkas.jba.repository.SecurityQuestionRepository;
import cz.jiripinkas.jba.repository.StatusRepository;
import cz.jiripinkas.jba.repository.TransactionRepository;
import cz.jiripinkas.jba.repository.UserRepository;



@Transactional
@Service
public class InitDbService {

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private AcceptRepository acceptRepository;

	@Autowired
	private CommitRepository commitRepository;

	@Autowired
	private ComplaintRepository complaintRepository;

	@Autowired
	private SecurityQuestionRepository securityRepository;

	@Autowired
	private StatusRepository statusRepository;

	@Autowired
	private TransactionRepository transactionRepository;

	@PostConstruct
	public void init() {

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		if (roleRepository.findByName("ROLE_ADMIN") == null) {

			/* Helper table value setting */

			/* Initializing Status table */
			Status z = new Status();
			z.setName("SAVED");
			statusRepository.save(z);
			
			Status k = new Status();
			k.setName("AWAITING_SUBMISSION");
			statusRepository.save(k);
			
			Status a = new Status();
			a.setName("SUBMITTED");
			statusRepository.save(a);

			Status b = new Status();
			b.setName("ACCEPTED");
			statusRepository.save(b);

			Status c = new Status();
			c.setName("APPROVED");
			statusRepository.save(c);

			Status d = new Status();
			d.setName("PROCESSED");
			statusRepository.save(d);

			Status e = new Status();
			e.setName("REJECTED");
			statusRepository.save(e);

			Status f = new Status();
			f.setName("ACTIVE");
			statusRepository.save(f);

			Status g = new Status();
			g.setName("INACTIVE");
			statusRepository.save(g);

			Status h = new Status();
			h.setName("SYSTEM");
			statusRepository.save(h);

			Status i = new Status();
			i.setName("CREDITED");
			statusRepository.save(i);

			
			Status j = new Status();
			j.setName("DEBITED");
			statusRepository.save(j);

			/* Initializing Status table */

			/* Initializing SecurityQuestion Table */

			SecurityQuestion question1 = new SecurityQuestion();
			question1.setSecurityQ("Name of your favourite childhood teacher?");
			SecurityQuestion question2 = new SecurityQuestion();
			question2.setSecurityQ("Name of your first pet?");
			SecurityQuestion question3 = new SecurityQuestion();
			question3.setSecurityQ("Name of your fiance?");
			SecurityQuestion question4 = new SecurityQuestion();
			question4.setSecurityQ("What you want to become?");
			SecurityQuestion question5 = new SecurityQuestion();
			question5.setSecurityQ("City in which you where born?");
			SecurityQuestion question6 = new SecurityQuestion();
			question6.setSecurityQ("Your mother's surname?");

			securityRepository.save(question1);
			securityRepository.save(question2);
			securityRepository.save(question3);
			securityRepository.save(question4);
			securityRepository.save(question5);
			securityRepository.save(question6);

			/* Initializing SecurityQuestion Table END */

			/* Initializing Role table */

			Role roleUser = new Role();
			roleUser.setName("ROLE_USER");
			roleRepository.save(roleUser);

			Role roleAdmin = new Role();
			roleAdmin.setName("ROLE_ADMIN");
			roleRepository.save(roleAdmin);

			/* Initializing Role table END */

			/* Helper table value setting END */

			/* Saving admin to database by default */

			User userAdmin = new User();
			userAdmin.setName("su");
			userAdmin.setPassword(encoder.encode("gw"));

			List<Role> roles = new ArrayList<Role>();
			roles.add(roleAdmin);
			roles.add(roleUser);
			userAdmin.setRoles(roles);
			userAdmin.setEnabled(true);
			userAdmin.setPosition('R');
			userAdmin.setGender('M');
			userAdmin.setAddress("E1");
			userAdmin.setCity("Nainital");
			userAdmin.setState("Uttarakhand");
			userAdmin.setCountry("India");
			userAdmin.setSecurityQuestion(question1);
			userAdmin.setSecurityAnswer(encoder.encode("patrick"));
			userAdmin.setOtp("0000");
			userAdmin.setSponser(null);
			userAdmin.setMobNo("0123456789");
			userAdmin.setDoj(Calendar.getInstance(TimeZone.getTimeZone("IST")).getTime());
			userAdmin.setLife(0);
			List<User> downlineUsersAdmin = new ArrayList<User>();
			userAdmin.setDownlineUsers(downlineUsersAdmin);

			userRepository.save(userAdmin);

			/*saving user-1 to database*/
			
			User userUser = new User();
			userUser.setName("user-1");
			userUser.setPassword(encoder.encode("pass"));
			List<Role> userUserRoles = new ArrayList<Role>();
			userUserRoles.add(roleUser);
			userUser.setRoles(userUserRoles);
			userUser.setEnabled(true);
			userUser.setPosition('L');
			userUser.setGender('M');
			userUser.setAddress("F1");
			userUser.setCity("Nainital");
			userUser.setState("Uttarakhand");
			userUser.setCountry("India");
			userUser.setSecurityQuestion(question2);
			userUser.setSecurityAnswer(encoder.encode("lalu"));
			userUser.setOtp("0000");
			userUser.setSponser(userAdmin);
			userUser.setMobNo("0123456");
			userUser.setDoj(Calendar.getInstance(TimeZone.getTimeZone("IST")).getTime());
			userUser.setLife(0);
			userRepository.save(userUser);

			/*saving user-2 to database*/
			
			User userUser2 = new User();
			userUser2.setName("user-2");
			userUser2.setPassword(encoder.encode("pass"));
			List<Role> userUserRoles2 = new ArrayList<Role>();
			userUserRoles2.add(roleUser);
			userUser2.setRoles(userUserRoles);
			userUser2.setEnabled(true);
			userUser2.setPosition('L');
			userUser2.setGender('M');
			userUser2.setAddress("F1");
			userUser2.setCity("Nainital");
			userUser2.setState("Uttarakhand");
			userUser2.setCountry("India");
			userUser2.setSecurityQuestion(question2);
			userUser2.setSecurityAnswer(encoder.encode("lalu"));
			userUser2.setOtp("0000");
			userUser2.setSponser(userUser);
			userUser2.setMobNo("0123456");
			userUser2.setDoj(Calendar.getInstance(TimeZone.getTimeZone("IST")).getTime());
			userUser2.setLife(0);
			userRepository.save(userUser2);

		}
	}

}
