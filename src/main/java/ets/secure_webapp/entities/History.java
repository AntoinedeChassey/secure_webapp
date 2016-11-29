package ets.secure_webapp.entities;

import java.sql.Timestamp;

public class History {

	private Integer id_history;
	private Integer id_user;
	private String password;
	private Timestamp date;

	public History(Integer id_history, Integer id_user, String password, Timestamp date) {
		super();
		this.id_history = id_history;
		this.id_user = id_user;
		this.password = password;
		this.date = date;
	}

	public Integer getId_history() {
		return id_history;
	}

	public void setId_history(Integer id_history) {
		this.id_history = id_history;
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
