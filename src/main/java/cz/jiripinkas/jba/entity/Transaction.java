package cz.jiripinkas.jba.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@SelectBeforeUpdate(value = true)
@DynamicUpdate(value = true)
public class Transaction {

	@Id
	@GeneratedValue
	private Integer id;

	private long amount;

	private long balBeforeTran;

	private long balAfterTran;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateTransaction;

	private String remark;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

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

	public long getBalBeforeTran() {
		return balBeforeTran;
	}

	public void setBalBeforeTran(long balBeforeTran) {
		this.balBeforeTran = balBeforeTran;
	}

	public long getBalAfterTran() {
		return balAfterTran;
	}

	public void setBalAfterTran(long balAfterTran) {
		this.balAfterTran = balAfterTran;
	}

	public Date getDateTransaction() {
		return dateTransaction;
	}

	public void setDateTransaction(Date dateTransaction) {
		this.dateTransaction = dateTransaction;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
