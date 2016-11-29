package ets.secure_webapp.entities;

import java.sql.Timestamp;

public class LogConnection {

	private Integer id_log_connection;
	private Integer id_user;
	private Integer phase;
	private Integer attempts;
	private Timestamp date;

	public LogConnection(Integer id_log_connection, Integer id_user, Integer phase, Integer attempts, Timestamp date) {
		super();
		this.id_log_connection = id_log_connection;
		this.id_user = id_user;
		this.phase = phase;
		this.attempts = attempts;
		this.date = date;
	}

	public Integer getId_log_connection() {
		return id_log_connection;
	}

	public void setId_log_connection(Integer id_log_connection) {
		this.id_log_connection = id_log_connection;
	}

	public Integer getId_user() {
		return id_user;
	}

	public void setId_user(Integer id_user) {
		this.id_user = id_user;
	}

	public Integer getPhase() {
		return phase;
	}

	public void setPhase(Integer phase) {
		this.phase = phase;
	}

	public Integer getAttempts() {
		return attempts;
	}

	public void setAttempts(Integer attempts) {
		this.attempts = attempts;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}
}
