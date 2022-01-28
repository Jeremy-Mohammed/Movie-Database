//Class to call and set seat
public class chooseSeat {
    private static String seatRow;
    private static String seatNum;

    public static String getSeatRow(){
        return seatRow;
    }
    public static String getSeatNum(){
        return seatNum;
    }
    public static void setSeatRow(String choice){
        seatRow = choice;
    }
    public static void setSeatNum(String choice){
        seatNum = choice;
    }
}
