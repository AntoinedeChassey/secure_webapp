package ets.secure_webapp.entities;

public class Role {

	private Integer id_role;
	private String name;
	private Integer maxInactiveInterval;
	private Integer maxAttempts;
	private Long maxTimeforPhase1;

	public Role(Integer id_role, String name, Integer maxInactiveInterval, Integer maxAttempts, Long maxTimeforPhase1) {
		super();
		this.id_role = id_role;
		this.name = name;
		this.maxInactiveInterval = maxInactiveInterval;
		this.maxAttempts = maxAttempts;
		this.maxTimeforPhase1 = maxTimeforPhase1;
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

	public Integer getMaxAttempts() {
		return maxAttempts;
	}

	public void setMaxAttempts(Integer maxAttempts) {
		this.maxAttempts = maxAttempts;
	}

	public Long getMaxTimeforPhase1() {
		return maxTimeforPhase1;
	}

	public void setMaxTimeforPhase1(Long maxTimeforPhase1) {
		this.maxTimeforPhase1 = maxTimeforPhase1;
	}
}
