package cz.jiripinkas.jba.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@SelectBeforeUpdate(value=true)
@DynamicUpdate(value=true)
public class Accept {

	@Id
	@GeneratedValue
	private Integer id;

	private Integer parentId;
	
	private long amount;

	private long originalAmount;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date reqDate;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date confDate;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	private String born;

	@ManyToOne
	@JoinColumn(name = "status_id")
	private Status status;

	@OneToMany(mappedBy = "accept")
	private List<Commit> commits;

	public Accept() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Accept(long amount, long originalAmount, Date reqDate,
			Date confDate, User user, String born, Status status, Integer parentId) {
		super();
		this.amount = amount;
		this.originalAmount = originalAmount;
		this.reqDate = reqDate;
		this.confDate = confDate;
		this.user = user;
		this.born = born;
		this.status = status;
		this.parentId = parentId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}

	public Date getReqDate() {
		return reqDate;
	}

	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}

	public Date getConfDate() {
		return confDate;
	}

	public void setConfDate(Date confDate) {
		this.confDate = confDate;
	}



	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	

	public List<Commit> getCommits() {
		return commits;
	}


	public void setCommits(List<Commit> commits) {
		this.commits = commits;
	}


	public long getOriginalAmount() {
		return originalAmount;
	}


	public void setOriginalAmount(long originalAmount) {
		this.originalAmount = originalAmount;
	}


	public String getBorn() {
		return born;
	}


	public void setBorn(String born) {
		this.born = born;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	
	
}
