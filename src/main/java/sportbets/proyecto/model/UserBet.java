package sportbets.proyecto.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Data
@Table("userbets")
public class UserBet {
    @Id
    String id_bet;
    String email;
    String status;
}
