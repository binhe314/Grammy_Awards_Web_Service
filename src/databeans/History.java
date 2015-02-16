package databeans;

import java.util.Date;

import org.genericdao.PrimaryKey;

@PrimaryKey("id")
public class History {
	private int id;
	private String fullName;
	private Date searchDate;
	private String stringDate;
	private int searchNum; // number of celebrity search in our website
	
	public int getId() {return id;}
	public String getFullName() {return fullName; }
	public Date getSearchDate() {return searchDate; }
	public int getSearchNum() {return searchNum; }
	public String getStringDate() {return stringDate; }
	
	public void setId(int i) {id = i; }
	public void setFullName(String s) {fullName = s; }
	public void setSearchDate(Date d) {searchDate = d; }
	public void setSearchNum(int i) {searchNum = i; }
	public void setStringDate(String s){stringDate = s;}
	
}
