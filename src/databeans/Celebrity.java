package databeans;

import org.genericdao.PrimaryKey;

@PrimaryKey("fullName")
public class Celebrity {
	private String fullName;
	private int searchNum; // number of celebrity search in our website
		
	public String getFullName() {return fullName; }
	public int getSearchNum() {return searchNum; }
	
	public void setFullName(String s) {fullName = s; }
	public void setSearchNum(int i) {searchNum = i; }
	
}
