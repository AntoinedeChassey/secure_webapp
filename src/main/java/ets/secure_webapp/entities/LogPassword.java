package ets.secure_webapp.entities;

import java.sql.Timestamp;

public class LogPassword {

	private Integer id_log_password;
	private Integer id_user;
	private String password;
	private Timestamp date;

	public LogPassword(Integer id_log_password, Integer id_user, String password, Timestamp date) {
		super();
		this.id_log_password = id_log_password;
		this.id_user = id_user;
		this.password = password;
		this.date = date;
	}

	public Integer getId_log_password() {
		return id_log_password;
	}

	public void setId_log_password(Integer id_log_password) {
		this.id_log_password = id_log_password;
	}

	public Integer getId_user() {
		return id_user;
	}

	public void setId_user(Integer id_user) {
		this.id_user = id_user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}
}
