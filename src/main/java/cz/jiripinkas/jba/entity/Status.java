package cz.jiripinkas.jba.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Status {

	@Id
	@GeneratedValue
	private Integer id;

	private String name;

	@OneToMany(mappedBy = "status")
	private List<Accept> accept;

	@OneToMany(mappedBy = "status")
	private List<Commit> commit;

	@OneToMany(mappedBy = "status")
	private List<Complaint> complaints;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Accept> getAccept() {
		return accept;
	}

	public void setAccept(List<Accept> accept) {
		this.accept = accept;
	}

	public List<Commit> getCommit() {
		return commit;
	}

	public void setCommit(List<Commit> commit) {
		this.commit = commit;
	}

	public List<Complaint> getComplaints() {
		return complaints;
	}

	public void setComplaints(List<Complaint> complaints) {
		this.complaints = complaints;
	}


	
}
