package sportbets.proyecto.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Data
@Table("userbanco")
public class UserBanco {
    @Id
    String email;
    String saldo;
}
