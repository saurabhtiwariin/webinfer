package cz.jiripinkas.jba.event;

import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationEvent;

import cz.jiripinkas.jba.entity.User;
import cz.jiripinkas.jba.event.listener.RegistrationListener;

@SuppressWarnings("serial")
public class OnRegistrationCompleteEvent extends ApplicationEvent {

	private static final Logger logger = Logger.getLogger(RegistrationListener.class);
	
    private final String appUrl;
    private final Locale locale;
    private final User user;

    public OnRegistrationCompleteEvent(final User user, final Locale locale, final String appUrl) {
        super(user);
        this.user = user;
        this.locale = locale;
        this.appUrl = appUrl;
        
        logger.info("In OnRegistrationCompleteEvent-ApplicationEvent");
    }

    //

    public String getAppUrl() {
        return appUrl;
    }

    public Locale getLocale() {
        return locale;
    }

    public User getUser() {
        return user;
    }

}
