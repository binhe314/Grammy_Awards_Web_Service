package controller;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import twitter4j.ResponseList;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.User;
import twitter4j.conf.Configuration;
import twitter4j.conf.ConfigurationBuilder;
import formbeans.TwitterNames;

public class DetailAction extends Action {

	@Override
	public String getName() {
		return "detail.do";
	}

	@Override
	public String perform(HttpServletRequest request) {
		String name = request.getParameter("name");
		String twitterID = new TwitterNames().getTwitterAccount(name);
		try {
			User user = fetchUserProfile("twiterID");
			// int totalStatusCount=user.getStatusesCount();
			user.getCreatedAt();
			user.getDescription();
			request.setAttribute("artist", user);
			System.out.println("request set with artist");
			return "detail.jsp";
		} catch (TwitterException e) {
			e.printStackTrace();
		}

		// get profile information from twitter

		return null;
	}

	private static User fetchUserProfile(String string) throws TwitterException {
		// ConfigurationBuilder cb = new ConfigurationBuilder();
		// cb.setOAuthConsumerKey("CONSUMER_KEY");
		// cb.setOAuthConsumerSecret("CONSUMER_SECRET");
		// cb.setOAuthAccessToken("TOKEN");
		// cb.setOAuthAccessToken("TOKEN_SECRET");
		Twitter twitter = new TwitterFactory().getInstance();
		// ResponseList<Status> userProfile=twitter.getUserTimeline();
		String users[] = new String[1];
		users[0] = string;
		ResponseList<User> listUser = twitter.lookupUsers(users);
		User user = listUser.get(0);
		if (user.getStatus() != null) {
			System.out.println(user.getScreenName());
			System.out.println(user.getName());
			System.out.println("follower" + user.getFollowersCount());
			System.out.println("friends " + user.getFriendsCount());
		}
		return user;
	}

	public void fetchDetails(HttpServletRequest request, String name)
			throws IOException {
		/******************* Amey *******************/

		Twitter twitter1 = (Twitter) request.getSession().getAttribute(
				"twitter");

		String twitterID = new TwitterNames().getTwitterAccount(name);
		System.out.println("twitter id " + twitterID);
		String users[] = new String[1];
		users[0] = twitterID;
		ResponseList<User> listUser = null;
		try {
			listUser = twitter1.lookupUsers(users);
		} catch (TwitterException e) {
			e.printStackTrace();
		}
		User user = listUser.get(0);
		user.getFollowersCount();
		user.getStatusesCount();
		user.getLocation();
		// user.get
		user.getURL();
		request.setAttribute("artist", user);
		/***********************************************/

	}

	public static long getFollowers(HttpServletRequest request,String name) {
		Twitter twitter1 = (Twitter) request.getSession().getAttribute(
				"twitter");

		String twitterID = new TwitterNames().getTwitterAccount(name);
		System.out.println("twitter id " + twitterID);
		String users[] = new String[1];
		users[0] = twitterID;
		ResponseList<User> listUser = null;
		try {
			listUser = twitter1.lookupUsers(users);
		} catch (TwitterException e) {
			e.printStackTrace();
		}
		User user = listUser.get(0);
		return user.getFollowersCount();
		
		// user.get
		
		
	}
}
