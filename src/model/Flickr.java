package model;

import java.io.*;
import java.net.*;
import java.util.ArrayList;
import java.util.Iterator;

import javax.xml.namespace.QName;
import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.events.Attribute;
import javax.xml.stream.events.StartElement;
import javax.xml.stream.events.XMLEvent;

/**
 * Reference : http://java4ever.blogspot.com/2008/08/play-with-flickr-api-in-java.html
 */


public class Flickr {

	

	static String apiKey = "f32c2888bb5463bef096a1f1bb70159b";
	static String secret = "fe171ca0d2efa505";
	static String count = "6";




	
	
	
	// search photo by key words.
		public static ArrayList<String> searchPhoto(String tag1)
				throws MalformedURLException, IOException, XMLStreamException {
			ArrayList<String> res = new ArrayList<String>();
			String method = "flickr.photos.search";
			int numOfPhoto = Integer.parseInt(count);
			String tag2 = "Grammy";

		

			URLConnection uc = new URL(
//					"https://api.flickr.com/services/rest/?method=" + method
//							+ "&api_key=" + apiKey + "&per_page=" + count
//							+ "&tags=" + tag1 + ",+" + tag2 + "&tag_mode=all")
//					.openConnection();
					"https://api.flickr.com/services/rest/?method=" + method
					+ "&api_key=" + apiKey + "&per_page=" + count
					+ "&text=" + URLEncoder.encode(tag1, "UTF-8")
					+ "&tag_mode=all&content_type=1&sort=relevance")
					.openConnection();

			BufferedReader br = new BufferedReader(new InputStreamReader(
					uc.getInputStream()));

			BufferedWriter bw = new BufferedWriter(new FileWriter(new File(
					"searchPhoto.xml")));

			String next;
			String[] servers = new String[numOfPhoto];
			String[] idList = new String[numOfPhoto];
			String[] secretList = new String[numOfPhoto];
			while ((next = br.readLine()) != null) {

				bw.write(next);// fastest the way to read and write
			}

			br.close();
			bw.close();

			String filename = "searchPhoto.xml";
			XMLInputFactory factory = XMLInputFactory.newInstance();

			XMLEventReader r = factory.createXMLEventReader(filename,
					new FileInputStream(filename));
			int i = -1;
			while (r.hasNext()) {
				XMLEvent event = r.nextEvent();
				if (event.isStartElement()) {
					StartElement element = (StartElement) event;
					String elementName = element.getName().toString();

					if (elementName.equals("photo")) {// xml element starts with
														// photo
						i++;
						Iterator iterator = element.getAttributes();

						while (iterator.hasNext()) {

							Attribute attribute = (Attribute) iterator.next();
							QName name = attribute.getName();
							String value = attribute.getValue();
							if ((name.toString()).equals("server")) {
								servers[i] = value;
							}
							if ((name.toString()).equals("id")) {
								idList[i] = value;
							}
							if ((name.toString()).equals("secret")) {
								secretList[i] = value;
							}
						}
					}
				}
			}
			System.out.println(i);

			for (int j = 0; j <= i; j++) {
				String flickrurl = "http://static.flickr.com/" + servers[j] + "/"
						+ idList[j] + "_" + secretList[j] + ".jpg";
				System.out.println(flickrurl);
				res.add(flickrurl);
			}

			getPhotoInfo(idList, secretList);
			return res;
		
		}
		

	// get photo information by photo id and secret.
	public static void getPhotoInfo(String[] idList, String[] secretList)
			throws XMLStreamException, MalformedURLException, IOException {
		
		String method = "flickr.photos.getInfo";
	
		int numOfPhoto = Integer.parseInt(count);
		String[] servers = new String[numOfPhoto];
		idList = new String[numOfPhoto];
		secretList = new String[numOfPhoto];

		String filename = "searchPhoto.xml";
		XMLInputFactory factory = XMLInputFactory.newInstance();

		XMLEventReader r = factory.createXMLEventReader(filename,
				new FileInputStream(filename));
		int i = -1;
		while (r.hasNext()) {
			XMLEvent event = r.nextEvent();
			if (event.isStartElement()) {
				StartElement element = (StartElement) event;
				String elementName = element.getName().toString();

				if (elementName.equals("photo")) {// xml element starts with
													// photo
					i++;
					Iterator iterator = element.getAttributes();

					while (iterator.hasNext()) {

						Attribute attribute = (Attribute) iterator.next();
						QName name = attribute.getName();
						String value = attribute.getValue();
						if ((name.toString()).equals("server")) {
							servers[i] = value;
						}
						if ((name.toString()).equals("id")) {
							idList[i] = value;
						}
						if ((name.toString()).equals("secret")) {
							secretList[i] = value;
						}
					}
				}
			}
		}
		//System.out.println(i);

		URLConnection[] ucs = new URLConnection[numOfPhoto];
		for (int n = 0; n < numOfPhoto; n++)
			ucs[n] = null;

		
		// write photo ids[m] to photo_id.xml
		for (int m = 0; m < numOfPhoto; m++) {
			ucs[m] = new URL("https://api.flickr.com/services/rest/?method="
					+ method + "&api_key=" + apiKey + "&photo_id=" + idList[m]
					+ "&secret=" + secretList[m]).openConnection();



			BufferedReader br = new BufferedReader(new InputStreamReader(
					ucs[m].getInputStream()));
	
			String newFileName = String.format("Photo_%s.xml", idList[m]);
			BufferedWriter bw = new BufferedWriter(new FileWriter(new File(
					newFileName)));

			String nextline;
			String[] title = new String[numOfPhoto];
			String[] descriptions = new String[numOfPhoto];
			String[] dates = new String[numOfPhoto];
			while ((nextline = br.readLine()) != null) {

				bw.write(nextline);// fastest the way to read and write
			}

			br.close();
			bw.close();
		}

	}

	
}
