package databeans;

import org.genericdao.PrimaryKey;

@PrimaryKey("userName")
public class TwitterBean {
	private String userName;
	private String tweet;

	public String getUserName() {return userName;}
	public String getTweet() {return tweet; }
	
	public void setUserName(String s) {userName = s;}
	public void setTweet(String s) {tweet = s; }
	
}
