package databeans;

import org.genericdao.PrimaryKey;

@PrimaryKey("twitterName")
public class Celebrity {
	private String fullName;
	private String twitterName;
	private int followerNum; // number of followers of that celebrity
	private int searchNum; // number of celebrity search in our website
		
	public String getFullName() {return fullName; }
	public String getTwitterName() {return twitterName; }
	public int getFollowerNum() {return followerNum; }
	public int getSearchNum() {return searchNum; }
	
	public void setFullName(String s) {fullName = s; }
	public void setTwitterName(String s) {twitterName = s; }
	public void setFollowerNum(int i) {followerNum = i; }
	public void setSearchNum(int i) {searchNum = i; }
	
}
