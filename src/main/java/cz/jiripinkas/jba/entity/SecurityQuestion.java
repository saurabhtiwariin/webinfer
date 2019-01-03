package cz.jiripinkas.jba.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class SecurityQuestion {

	@Id
	@GeneratedValue
	private Integer id;

	private String securityQ;

	@OneToMany(mappedBy="securityQuestion")
	private List<User> users;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSecurityQ() {
		return securityQ;
	}

	public void setSecurityQ(String securityQ) {
		this.securityQ = securityQ;
	}


}
