package cz.jiripinkas.jba.scheduling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cz.jiripinkas.jba.service.UserService;

@Component("myBean")
public class MyBean {

	@Autowired
	private UserService userService;
	
	public void printMessage() {
		System.out.println("I am called by MethodInvokingJobDetailFactoryBean using SimpleTriggerFactoryBean");
	}

	public void updateUserBalanceCronJob() {
		userService.updateUserBalanceCronJob();
	}
	
}
