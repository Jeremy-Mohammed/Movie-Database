import java.util.Arrays;

//Class to call and set film style choice
public class chooseFilmStyle {
    private static String[] filmStyleList = {"Regular","IMAX","3D","Xpand"};
    private static String filmStyle;

    public static String getFilmStyle(){
        return filmStyle;
    }
    public static void getFilmStyleList(){
        System.out.println("\n" + Arrays.toString(filmStyleList));
    }
    public static void setFilmStyle(String choice){
        filmStyle = choice;
    }
}
