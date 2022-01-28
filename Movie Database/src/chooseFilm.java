import java.util.Arrays;

//Class to call and set film choice
public class chooseFilm {
    private static String[] filmList = {"Tenet","WW84","Land","Freaky"};
    private static String film;

    public static String getFilm(){
        return film;
    }
    public static void getFilmList(){
        System.out.println("\n" + Arrays.toString(filmList));
    }
    public static void setFilm(String choice){
        film = choice;
    }
}
