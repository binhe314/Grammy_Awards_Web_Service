package formbeans;

import javax.servlet.http.HttpSession;

import org.mybeans.form.FormBean;

public class SearchForm extends FormBean{
	private String celebrity;
	private String action;
	private HttpSession httpSession;

	public String getCelebrity() {
		return celebrity;
	}

	public void setCelebrity(String celebrity) {
		this.celebrity = celebrity;
	}
	public HttpSession getHttpSession() {
		return httpSession;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String s) {
		action = s;
	}
	
}
