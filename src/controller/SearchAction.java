package controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.stream.XMLStreamException;

import model.CelebrityDAO;
import model.Flickr;
import model.HistoryDAO;
import model.Model;
import model.UserDAO;

import org.genericdao.MatchArg;
import org.genericdao.RollbackException;
import org.mybeans.form.FormBeanException;
import org.mybeans.form.FormBeanFactory;

import databeans.Celebrity;
import databeans.History;
import formbeans.SearchForm;
import formbeans.TwitterNames;

public class SearchAction extends Action {
	private FormBeanFactory<SearchForm> formBeanFactory = FormBeanFactory
			.getInstance(SearchForm.class);
	private UserDAO userDAO;
	private HistoryDAO historyDAO;
	private CelebrityDAO celebrityDAO;


	public SearchAction(Model model) {
		userDAO = model.getUserDAO();
		historyDAO = model.getHistoryDAO();
		celebrityDAO = model.getCelebrityDAO();
	}

	public String getName() {
		return "search.do";
	}

	public String perform(HttpServletRequest request) {
		try {
			List<String> errors = new ArrayList<String>();
			errors.add("weimaomeiyouaaaaaa");
			request.setAttribute("errors", errors);

			SearchForm form = formBeanFactory.create(request);
			request.setAttribute("form", form);
			
			String tag = form.getCelebrity();
			String tag2 = request.getParameter("celebrity");
			if (tag2 != null && tag2.length() != 0) {
				tag = tag2;
			}
			System.out.println(tag + "@@@@@@@@@@@@@");
			
			//Bin, today without timestamp
			Calendar cal = Calendar.getInstance();
			cal.clear(Calendar.HOUR_OF_DAY);
			cal.clear(Calendar.AM_PM);
			cal.clear(Calendar.HOUR);
			cal.clear(Calendar.MINUTE);
			cal.clear(Calendar.SECOND);
			cal.clear(Calendar.MILLISECOND);
			
			SimpleDateFormat sdf = new SimpleDateFormat("MMM dd");
			String sDate = sdf.format(cal.getTime());
			
			//Bin, update history record
			History historyList[] = historyDAO.match(MatchArg.and(
										MatchArg.equals("fullName", tag),
										MatchArg.equals("searchDate", cal.getTime())));
			if (historyList != null && historyList.length != 0) {
				History historyBean = historyList[0];
				historyBean.setSearchNum(historyBean.getSearchNum() + 1);
				historyDAO.update(historyBean);
			} else {
				History historyBean = new History();
				historyBean.setFullName(tag);
				historyBean.setSearchDate(cal.getTime());
				historyBean.setStringDate(sDate);
				historyBean.setSearchNum(1);
				historyDAO.createAutoIncrement(historyBean);
			}
			
			String twitterUserName=new TwitterNames().getTwitterAccount(tag);
			request.setAttribute("twitterName",twitterUserName);
			System.out.println("twitterName " +twitterUserName);
			new DetailAction().fetchDetails(request,twitterUserName);
			ArrayList<String> flickr = new ArrayList<String>();
			flickr = Flickr.searchPhoto(tag);
			String photo = flickr.get(0).toString();
			//amey
			new DetailAction().fetchDetails(request,tag);
			
			request.setAttribute("photo", photo);
			flickr.remove(0);
			request.setAttribute("flickrs", flickr);
			
			Celebrity celeBean = celebrityDAO.read(tag);
			if (celeBean == null) {
				celeBean = new Celebrity();
				celeBean.setFullName(tag);
				celeBean.setSearchNum(1);
				celebrityDAO.create(celeBean);
			} else {
				celeBean.setSearchNum(celeBean.getSearchNum() + 1);
				celebrityDAO.update(celeBean);
			}
		
			//Bin, set up Google Chart parameters
			Calendar calStart = cal;
			calStart.add(Calendar.DATE, -6);
			calStart.clear(Calendar.HOUR_OF_DAY);
			calStart.clear(Calendar.AM_PM);
			calStart.clear(Calendar.HOUR);
			calStart.clear(Calendar.MINUTE);
			calStart.clear(Calendar.SECOND);
			calStart.clear(Calendar.MILLISECOND);
			
			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");				
			
			History historyChart[] = historyDAO.match(MatchArg.and(
										MatchArg.equals("fullName", tag),
										MatchArg.greaterThanOrEqualTo("searchDate", calStart.getTime())));
			//sort history list
			for (int i = 0; i < historyChart.length; i++) {
				for (int j = i+1; j < historyChart.length; j++) {
					Date jDate = historyChart[j].getSearchDate();
					Date iDate = historyChart[i].getSearchDate();
					if (jDate.compareTo(iDate) < 0) {
						History temp = historyChart[i];
						historyChart[i] = historyChart[j];
						historyChart[j] = temp;
					}
				}
			}
				
			request.setAttribute("historyChart", historyChart);
			
			//Bin, set up Google chart 2
			Celebrity celebrityTotal[] = celebrityDAO.match();
			int totalNum = 0;
			for (int i = 0; i < celebrityTotal.length; i++) {
				totalNum += celebrityTotal[i].getSearchNum();
			}
			
			Celebrity celebrityTag[] = celebrityDAO.match(MatchArg.equals("fullName", tag));
			int totalTag = 0;
			for (int i = 0; i < celebrityTag.length; i++) {
				totalTag += celebrityTag[i].getSearchNum();
			}
			
			request.setAttribute("otherNum", totalNum-totalTag);
			request.setAttribute("tagTotal", totalTag);
			System.out.println("total is " + totalNum);
			System.out.println("tag total is"+ totalTag);

			//create a  array of all 
			ArrayList<Celebrity> ar=new ArrayList<Celebrity>();
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			return "detail.jsp";
		}

		catch (IOException e) {
			e.printStackTrace();

			return "detail.jsp";

		} catch (XMLStreamException e) {
			e.printStackTrace();

			return "detail.jsp";

		} catch (FormBeanException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "detail.jsp";
		} catch (NullPointerException e){
			return "detail.jsp";
		} catch (RollbackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "detail.jsp";

		}
		return "detail.jsp";
	}
}
