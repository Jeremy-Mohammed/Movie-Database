import java.util.Formatter;

//Class to get price and set
public class payment {
    private static double price;
    private static double GSTHST;
    private static double total;

    public static double getPrice(){
        if (chooseFilmStyle.getFilmStyle().equals("Regular")){
            price = 8.99;
        }
        else {
            price = 10.99;
        }
        return price;
    }

    public static String getGSTHST(){
        GSTHST = getPrice()*0.13;
        String str = String.format("%.02f", GSTHST);
        return str;
    }
    public static String getTotal(){
        total = getPrice()*1.13;
        String str = String.format("%.02f", total);
        return str;
    }

}
