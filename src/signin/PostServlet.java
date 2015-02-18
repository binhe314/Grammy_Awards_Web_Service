package signin;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybeans.form.FileProperty;
import org.mybeans.form.FormBeanException;
import org.mybeans.form.FormBeanFactory;

import twitter4j.StatusUpdate;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import formbeans.UploadForm;

public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 2132731135996613711L;
	private FormBeanFactory<UploadForm> formBeanFactory = FormBeanFactory
			.getInstance(UploadForm.class);

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String text = request.getParameter("text");
		Twitter twitter = (Twitter) request.getSession()
				.getAttribute("twitter");
		try {
			String star = request.getParameter("celebrity");
			// twitter.updateStatus("#AllAboutTheGrammy "+text +" #"+star);

			UploadForm form = formBeanFactory.create(request);
			FileProperty fileProp = form.getFile();
			String name = null;
			name = fileProp.getFileName();
			text = form.getText();
			star = form.getCelebrity();
			StatusUpdate status = new StatusUpdate("#AllAboutTheGrammy " + text
					+ " #" + star);

			System.out.println(status + "!!!!!" + text);
			if (name == " " || name == null || name.isEmpty()) {
				twitter.updateStatus(status);
			} else {
				// File photo = new File("/Users/binhe/Desktop/"+name);
				File photo = new File(
						"C:\\Users\\Public\\Pictures\\Sample Pictures\\" + name);

				status.setMedia(photo);
				twitter.updateStatus(status);
			}

		} catch (TwitterException e) {
			throw new ServletException(e);
		} catch (FormBeanException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect(request.getHeader("Referer"));
	}
}
