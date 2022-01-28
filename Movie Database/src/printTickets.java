//Prints final ticket
public class printTickets {

    //Prints ticket
    public static void Ticket(){

        System.out.println("\n\n\n______________________________________\n");
        System.out.println("EEC " + chooseTheatre.getTheatre());
        System.out.println("Cinema 0" + ((int)(Math.random() * ((9 - 0) + 1)) + 0));
        System.out.println("_______________\n");
        System.out.println(chooseFilm.getFilm());
        System.out.println(chooseFilmStyle.getFilmStyle());
        System.out.println(chooseShowtime.getShowtime());
        System.out.println("Seat: " + chooseSeat.getSeatRow() + "-" + chooseSeat.getSeatNum() + "\n");
        System.out.println("Admission Price: $" + payment.getPrice());
        System.out.println("        GST/HST: $" + payment.getGSTHST());
        System.out.println("   Ticket Total: $" + payment.getTotal());
        System.out.println("\nPlease Retain Your Ticket");
        System.out.println("______________________________________\n\n");
        System.out.println("                        Thank you for choosing");
        theatreLogo.printTitle();
    }
}
