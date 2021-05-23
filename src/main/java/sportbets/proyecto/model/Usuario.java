package sportbets.proyecto.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
@Table("usuarios")
public class Usuario {

    @Id
    @NotNull
    @NotBlank
    String email;
    @NotNull
    @NotBlank
    @Size(min = 8, max = 15)
    String password;
    @NotNull
    @NotBlank
    String name;
    @NotNull
    @NotBlank
    String lastName;
    String logo;

    public Usuario(String email,String password, String name, String lastName){
        this.email = email;
        this.password = password;
        this.name = name;
        this.lastName = lastName;
    }
    public Usuario(String email,String password, String name, String lastName, String logo){
        this.email = email;
        this.password = password;
        this.name = name;
        this.lastName = lastName;
        this.logo = logo;
    }
    public Usuario(){}
}
