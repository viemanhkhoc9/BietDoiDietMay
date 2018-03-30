package com.example.model;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="category")
public class Category implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String title;
	private String content;
	private String attachment;
	@Column(name = "datecreated", columnDefinition="DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Date datecreated;
	@ManyToOne
	@JoinColumn(name = "creator")
	private User creator;
	@OneToMany(mappedBy = "category", cascade = CascadeType.ALL)
	private Set<News> newslist;
	public Set<News> getNewslist() {
		return newslist;
	}
	public void setNewslist(Set<News> newslist) {
		this.newslist = newslist;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAttachment() {
		return attachment;
	}
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	public Date getDatecreated() {
		return datecreated;
	}
	public void setDatecreated(Date datecreated) {
		this.datecreated = datecreated;
	}
	public User getCreator() {
		return creator;
	}
	public void setCreator(User creator) {
		this.creator = creator;
	}
	public Category(int id, String title, String content, String attachment, Date datecreated, User creator) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.attachment = attachment;
		this.datecreated = datecreated;
		this.creator = creator;
	}
	public Category() {}
}