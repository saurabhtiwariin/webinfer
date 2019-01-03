package cz.jiripinkas.jba.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;

@Entity
@SelectBeforeUpdate(value=true)
@DynamicUpdate(value=true)
public class FileUpload {
	@Id
	@GeneratedValue
	private Integer id;

	private String url;

	@OneToOne
	@JoinColumn(name="commit_id")
	private Commit commit;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Commit getCommit() {
	    return commit;
	}

	public void setCommit(Commit param) {
	    this.commit = param;
	}


}
