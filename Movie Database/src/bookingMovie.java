import javax.swing.*;
import java.util.*;
public class bookingMovie {

    public static void main(String []args) {
        Scanner input = new Scanner(System.in);
        theatreLogo.printTitle();

        //Pick theatre
        chooseTheatre.getTheatreList();
        System.out.print("Select a Theatre Location: ");
        chooseTheatre.setTheatre(input.next());

        //Pick film
        chooseFilm.getFilmList();
        System.out.print("Select a Film: ");
        chooseFilm.setFilm(input.next());

        //Pick film style
        chooseFilmStyle.getFilmStyleList();
        System.out.print("Select a Film Style: ");
        chooseFilmStyle.setFilmStyle(input.next());

        //Pick showtime
        chooseShowtime.getShowtimeList();
        System.out.print("Select a Showtime: ");
        chooseShowtime.setShowtime(input.next());

        //Pick seat
        System.out.print("\nSelect a Seat Row (A-J): ");
        chooseSeat.setSeatRow(input.next());
        do {
            try{
                System.out.print("\nSelect a Seat Number (1-20): ");
                chooseSeat.setSeatNum(input.next());
                Integer.parseInt(chooseSeat.getSeatNum());
                break;
            }
            catch (NumberFormatException ex){
                System.out.print("Invalid Input\n");
                continue;
            }

        }while(true);

        printTickets.Ticket();

    }
}
