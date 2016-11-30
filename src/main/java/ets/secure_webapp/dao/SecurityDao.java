package ets.secure_webapp.dao;

import java.util.List;

import ets.secure_webapp.entities.LogConnection;

public interface SecurityDao {
	
	public List<LogConnection> getLogConnections();
	
	public boolean incrementLogConnection(Integer id_user);

	public LogConnection getConnectionLogByUserId(Integer id_user);

	public boolean resetLogConnectionAttempts(Integer id_user);

	public boolean setLogConnectionPhase(Integer id_user, Integer phase);
}
