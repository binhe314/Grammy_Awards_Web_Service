package model;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;

import databeans.Celebrity;

public class CelebrityDAO extends GenericDAO<Celebrity>{
	public CelebrityDAO(String tableName, ConnectionPool pool) throws DAOException {
		super(Celebrity.class, tableName, pool);
	}
}
