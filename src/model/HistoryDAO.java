package model;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;

import databeans.History;

public class HistoryDAO extends GenericDAO<History>{
	public HistoryDAO(String tableName, ConnectionPool pool) throws DAOException {
		super(History.class, tableName, pool);
	}
	
}
