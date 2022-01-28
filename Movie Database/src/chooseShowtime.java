import java.util.Arrays;

//Class to call and set showtime choice
public class chooseShowtime {
    private static String[] showtimeList = {"1:30pm","4:00pm","7:30pm","11:30pm"};
    private static String showtime;

    public static String getShowtime(){
        return showtime;
    }
    public static void getShowtimeList(){
        System.out.println("\n" + Arrays.toString(showtimeList));
    }
    public static void setShowtime(String choice){
        showtime = choice;
    }
}


