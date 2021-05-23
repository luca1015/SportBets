package sportbets.proyecto.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Data
@Table("matchesbet")
public class MatchBet {
    @Id
    String idmatch;
    String idbet;
    String team;
    String cuota;
}
