package formbeans;

public class TwitterNames {

	public String getTwitterAccount(String name){
		if(name.equalsIgnoreCase("Sam Smith")|| name.contains("sam")){
			return "samsmithworld";
		}
		if(name.equalsIgnoreCase("Pharrell Williams") || name.contains("pharrell")){
			return "pharrell";
		}
		if(name.equalsIgnoreCase("Lady Gaga")|| name.contains("lady")||name.contains("gaga")){
			return "ladygaga";
		}
		if(name.equalsIgnoreCase("Rihanna")){
			return "rihanna";
		}
		if(name.equalsIgnoreCase("Kendrick Lamar")){
			return "kendricklamar";
		}
		if(name.equalsIgnoreCase("Taylor Swift")|| name.equalsIgnoreCase("taylor_swift")){
			return "taylorswift13";
		}
		if(name.equalsIgnoreCase("Beyonce")){
			return "Beyonce";
		}
		if(name.equalsIgnoreCase("Glen Campbell")){
			return "GlenCampbell";
		}
		if(name.equalsIgnoreCase("Katy Perry")){
			return "katyperry";
		}
		if(name.equalsIgnoreCase("Carrie Underwood")){
			return "carrieunderwood";
		}
		if(name.equalsIgnoreCase("Iggy Azalea")|| name.equalsIgnoreCase("iggy_azalea")){
			return "IGGYAZALEA";
		}
		if(name.equalsIgnoreCase("Meghan Trainor")){
			return "Meghan_Trainor";
		}
		if(name.equalsIgnoreCase("Meghan Trainor")){
			return "Meghan_Trainor";
		}
		if(name.equalsIgnoreCase("bruno_mars")){
			return "BrunoMars";
		}else 
			return "TheGRAMMYs";
	}
}