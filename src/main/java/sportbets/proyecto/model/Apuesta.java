package sportbets.proyecto.model;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class Apuesta {
    String bet_id;
    ArrayList<Partido> partido;
    double multiplicador;
    double cantidad_apostada;
    double total_ganancias;
    String status;
}
