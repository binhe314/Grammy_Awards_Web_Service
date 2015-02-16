package model;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;

import databeans.TwitterBean;

public class TwitterDAO extends GenericDAO<TwitterBean>{
	public TwitterDAO(String tableName, ConnectionPool pool) throws DAOException {
		super(TwitterBean.class, tableName, pool);
	}
}
