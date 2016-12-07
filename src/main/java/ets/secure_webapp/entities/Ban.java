package ets.secure_webapp.entities;

import java.sql.Timestamp;

public class Ban {

	private Integer id_ban;
	private String ip;
	private Timestamp date;

	public Ban(Integer id_ban, String ip, Timestamp date) {
		super();
		this.id_ban = id_ban;
		this.ip = ip;
		this.date = date;
	}

	public Integer getId_ban() {
		return id_ban;
	}

	public void setId_ban(Integer id_ban) {
		this.id_ban = id_ban;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}
}
