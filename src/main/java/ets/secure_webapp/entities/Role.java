package ets.secure_webapp.entities;

public class Role {

	private Integer id_role;
	private String name;
	private Integer maxInactiveInterval;

	public Role(Integer id_role, String name, Integer maxInactiveInterval) {
		super();
		this.id_role = id_role;
		this.name = name;
		this.maxInactiveInterval = maxInactiveInterval;
	}

	public Integer getId_role() {
		return id_role;
	}

	public void setId_role(Integer id_role) {
		this.id_role = id_role;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getMaxInactiveInterval() {
		return maxInactiveInterval;
	}

	public void setMaxInactiveInterval(Integer maxInactiveInterval) {
		this.maxInactiveInterval = maxInactiveInterval;
	}
}
