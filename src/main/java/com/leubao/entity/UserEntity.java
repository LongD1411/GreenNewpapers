package com.leubao.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
@Entity
@Table(name = "users")
public class UserEntity extends BaseEntity {
	@Column(name="fullname")
	private String fullName;
	@Column(name="username")
	private String userName;
	@Column(name="password")
	private String password;
	@Column(name="status")
	private int status;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name= "user_role",
					   joinColumns = @JoinColumn(name = "user_id"),
					inverseJoinColumns = @JoinColumn(name="role_id"))
	private List<RoleEntity> roles = new ArrayList<>();
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<RoleEntity> getRoles() {
		return roles;
	}
	public void setRoles(List<RoleEntity> roles) {
		this.roles = roles;
	}
	
}
