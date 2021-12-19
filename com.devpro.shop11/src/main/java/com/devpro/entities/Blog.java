package com.devpro.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;
import java.time.LocalDateTime;

@Entity
@Table(name = "tbl_blog")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Blog extends BaseEntity{
	
	@Column(name="title", length = 500)
	private String title;
	
	@Column(name="description", length = 500)
	private String description;
	
	
	@Column(name="image", length = 500)
	private String image;
	
	@Lob
	@Column(name = "content", columnDefinition = "LONGTEXT")
	private String content;

}
