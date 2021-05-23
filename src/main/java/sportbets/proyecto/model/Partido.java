package sportbets.proyecto.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Data
@Table("partidos")
public class Partido {
    @Id
    String id;
    String local;
    String visitante;
    String clocal;
    String empate;
    String cvisitante;
    String dateini;
    String datefini;
    String result;
    String status;
    String winner;
    String pais;
    public Partido(String id, String local, String visitante, String clocal, String empate, String cvisitante, String dateini, String datefini, String result, String status, String winner, String pais) {
        this.id = id;
        this.local = local;
        this.visitante = visitante;
        this.clocal = clocal;
        this.empate = empate;
        this.cvisitante = cvisitante;
        this.dateini = dateini;
        this.datefini = datefini;
        this.result = result;
        this.status = status;
        this.winner = winner;
        this.pais = pais;
    }
}