package formbeans;

import javax.servlet.http.HttpSession;

import org.mybeans.form.FileProperty;
import org.mybeans.form.FormBean;

public class UploadForm extends FormBean{
	private FileProperty file;
	private String celebrity;
	private String text;
	public String getCelebrity() {
		return celebrity;
	}

	public void setCelebrity(String celebrity) {
		this.celebrity = celebrity;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public FileProperty getFile() {
		return file;
	}

	public void setFile(FileProperty file) {
		this.file = file;
	}

	private String action;
	private HttpSession httpSession;

	
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
