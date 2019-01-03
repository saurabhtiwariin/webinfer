package cz.jiripinkas.jba.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@SelectBeforeUpdate(value=true)
@DynamicUpdate(value=true)
public class Commit {

	@Id
	@GeneratedValue
	private Integer id;

	private Integer parentId;

	private long amount;

	private long originalAmount;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date lifeTimestamp;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateCommit;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateLinked;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateChequeUploaded;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateConf;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@ManyToOne
	@JoinColumn(name = "status_id")
	private Status status;


	@ManyToOne
	@JoinColumn(name = "accept_id")
	private Accept accept;

	@OneToOne(mappedBy = "commit")
	private FileUpload fileUpload;

	public Commit() {
		super();
	}

	public Commit(long amount, Date dateCommit, User user, Status status, Integer parentId) {
		super();
		this.amount = amount;
		this.dateCommit = dateCommit;

		this.user = user;
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

	public Date getDateCommit() {
		return dateCommit;
	}

	public void setDateCommit(Date dateCommit) {
		this.dateCommit = dateCommit;
	}

	public Date getDateChequeUploaded() {
		return dateChequeUploaded;
	}

	public void setDateChequeUploaded(Date dateChequeUploaded) {
		this.dateChequeUploaded = dateChequeUploaded;
	}

	public Date getDateConf() {
		return dateConf;
	}

	public void setDateConf(Date dateConf) {
		this.dateConf = dateConf;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public Accept getAccept() {
	    return accept;
	}

	public void setAccept(Accept param) {
	    this.accept = param;
	}

	public FileUpload getFileUpload() {
	    return fileUpload;
	}

	public void setFileUpload(FileUpload param) {
	    this.fileUpload = param;
	}

	public Date getLifeTimestamp() {
		return lifeTimestamp;
	}


	public void setLifeTimestamp(Date lifeTimestamp) {
		this.lifeTimestamp = lifeTimestamp;
	}

	public Date getDateLinked() {
		return dateLinked;
	}

	public void setDateLinked(Date dateLinked) {
		this.dateLinked = dateLinked;
	}

	public long getOriginalAmount() {
		return originalAmount;
	}

	public void setOriginalAmount(long originalAmount) {
		this.originalAmount = originalAmount;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	
	
}
