package model;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;

public class Model {
	private UserDAO userDAO;
	private TwitterDAO twitterDAO;
	private CelebrityDAO celebrityDAO;
	private HistoryDAO historyDAO;
	
	public Model(ServletConfig config) throws ServletException {
		try {
			String jdbcDriver = config.getInitParameter("jdbcDriverName");
			String jdbcURL    = config.getInitParameter("jdbcURL");
			
			ConnectionPool pool = new ConnectionPool(jdbcDriver,jdbcURL);
			
			userDAO  = new UserDAO("User", pool);
			twitterDAO = new TwitterDAO("Twitter", pool);
			celebrityDAO = new CelebrityDAO("Celebrity", pool);
			historyDAO = new HistoryDAO("History", pool);
			
		} catch (DAOException e) {
			throw new ServletException(e);
		}
	}	

	public UserDAO getUserDAO()  { return userDAO; }
	public TwitterDAO getTwitterDAO() {return twitterDAO; }
	public CelebrityDAO getCelebrityDAO() {return celebrityDAO; }
	public HistoryDAO getHistoryDAO() {return historyDAO; }
		
}
