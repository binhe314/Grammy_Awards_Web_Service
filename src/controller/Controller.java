package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import twitter4j.Twitter;
import model.Model;

@SuppressWarnings("serial")
public class Controller extends HttpServlet {
	public void init() throws ServletException {
		Model model = new Model(getServletConfig());

		Action.add(new LoginAction(model));
		Action.add(new SearchAction(model));

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nextPage = performTheAction(request);
		sendToNextPage(nextPage, request, response);
	}

	private String performTheAction(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String servletPath = request.getServletPath();
		String action = getActionName(servletPath);
		// will be set in the customer to check whether user is a customer or
		// employee
		// if employee access this page wont be allows and will be direct to
		// access denied or page not found wrong url message
		
		System.out.println("session " + session);
		
//		Object user = session.getAttribute("user");
		Twitter twitter1 = (Twitter) request.getSession().getAttribute("twitter");
		if(twitter1==null){
			request.setAttribute("message","please login with your twitter account to continue");
			return "index.jsp";
		}
	
		System.out.println("Customer from session " + twitter1);

		System.out.println("creation time of session "
				+ session.getCreationTime());

		// Let the logged in user run his chosen action
		return Action.perform(action, request);

	}

	private void sendToNextPage(String nextPage, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (nextPage == null) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND,
					request.getServletPath());
			return;
		}

		if (nextPage.endsWith(".do")) {
			response.sendRedirect(nextPage);
			return;
		}

		if (nextPage.endsWith(".jsp")) {
			RequestDispatcher d = request
					.getRequestDispatcher(nextPage);
			d.forward(request, response);
			return;
		}

		response.sendRedirect(nextPage);
		return;
		// throw new
		// ServletException(Controller.class.getName()+".sendToNextPage(\"" +
		// nextPage + "\"): invalid extension.");
	}

	private String getActionName(String path) {
		// We're guaranteed that the path will start with a slash
		int slash = path.lastIndexOf('/');
		return path.substring(slash + 1);
	}

}
