package cz.jiripinkas.jba.event;

import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationEvent;

import cz.jiripinkas.jba.entity.Complaint;
import cz.jiripinkas.jba.event.listener.RegistrationListener;

@SuppressWarnings("serial")
public class OnComplaintCompleteEvent extends ApplicationEvent {

	private static final Logger logger = Logger.getLogger(RegistrationListener.class);
	
    private final String appUrl;
    private final Locale locale;
    private final Complaint complaint;

    public OnComplaintCompleteEvent(final Complaint complaint, final Locale locale, final String appUrl) {
        super(complaint);
        this.complaint = complaint;
        this.locale = locale;
        this.appUrl = appUrl;
        
        logger.info("In OnComplaintCompleteEvent-ApplicationEvent");
    }

    //

    public String getAppUrl() {
        return appUrl;
    }

    public Locale getLocale() {
        return locale;
    }

    public Complaint getComplaint() {
        return complaint;
    }

}
