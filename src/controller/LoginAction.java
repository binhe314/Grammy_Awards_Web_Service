package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.Model;
import model.UserDAO;

import org.genericdao.RollbackException;

import twitter4j.Twitter;
import twitter4j.TwitterException;
import databeans.User;

public class LoginAction extends Action {
	private UserDAO userDAO;

	public LoginAction(Model model) {
		userDAO = model.getUserDAO();
	}

	public String getName() {
		return "login.do";
	}

	public String perform(HttpServletRequest request) {
		try {
			Twitter twitter = (Twitter) request.getSession().getAttribute("twitter");
			HttpSession session=request.getSession();
			long userID = twitter.getId(); 
			User user = userDAO.read(userID);
			if(user==null){
				User u = new User();
				u.setUserID(userID);
				userDAO.create(u);
			}
			twitter4j.User userT=twitter.showUser(twitter.getScreenName());
			session.setAttribute("name",userT.getName());
		} catch (IllegalStateException | TwitterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RollbackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "index.jsp";
	}
}