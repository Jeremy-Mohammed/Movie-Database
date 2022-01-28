import java.util.Arrays;

//Class to call and set theatre choice
public class chooseTheatre {
    private static String[] theatreList = {"Toronto","Scarborough","Pickering","Markham"};
    private static String theatre;

    public static String getTheatre(){
        return theatre;
    }
    public static void getTheatreList(){
        System.out.println("\n" + Arrays.toString(theatreList));
    }
    public static void setTheatre(String choice){
        theatre = choice;
    }
}


