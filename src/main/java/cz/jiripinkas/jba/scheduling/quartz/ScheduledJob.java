package cz.jiripinkas.jba.scheduling.quartz;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import cz.jiripinkas.jba.scheduling.AnotherBean;


public class ScheduledJob extends QuartzJobBean{

	
	private AnotherBean anotherBean; 
	
	
	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		anotherBean.updateUserBalanceCronJob();

	}

	public void setAnotherBean(AnotherBean anotherBean) {
		this.anotherBean = anotherBean;
	}
}
