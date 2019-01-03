package cz.jiripinkas.jba.scheduling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cz.jiripinkas.jba.service.UserService;

@Component("anotherBean")
public class AnotherBean {
	
	@Autowired
	private UserService userService;
	
	public void printAnotherMessage(){
		System.out.println("I am called by Quartz jobBean using CronTriggerFactoryBean");
	}
	
	public void updateUserBalanceCronJob() {
		userService.updateUserBalanceCronJob();
	}

}
