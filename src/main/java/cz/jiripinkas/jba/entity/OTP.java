package cz.jiripinkas.jba.entity;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class OTP {
    private static final int EXPIRATION = 20;
 
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
     
    private String otp;
    
    private Date expiryDate;
 
    private boolean verified;
    
    public OTP() {
        super();
    }
    public OTP(String otp) {
        super();
        this.otp = otp;
        this.expiryDate = calculateExpiryDate(EXPIRATION);
        this.verified = false;
    }
     
    private Date calculateExpiryDate(int expiryTimeInMinutes) {
        Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("IST"));
        cal.setTime(new Timestamp(cal.getTime().getTime()));
        cal.add(Calendar.MINUTE, expiryTimeInMinutes);
        return new Date(cal.getTime().getTime());
    }
 
    public void updateOTP(final String otp) {
        this.otp = otp;
        this.expiryDate = calculateExpiryDate(EXPIRATION);
    }
	

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOtp() {
		return otp;
	}
	public void setOtp(String otp) {
		this.otp = otp;
	}
	public Date getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}
	public boolean isVerified() {
		return verified;
	}
	public void setVerified(boolean verified) {
		this.verified = verified;
	}
	public static int getExpiration() {
		return EXPIRATION;
	}
    
    // standard getters and setters
    
        
    
}