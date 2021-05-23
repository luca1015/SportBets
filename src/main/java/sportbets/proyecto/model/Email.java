package sportbets.proyecto.model;

import lombok.Data;

import javax.validation.constraints.NotNull;

@Data
public class Email {
    @NotNull
    private String email;
    private String issue;
}
