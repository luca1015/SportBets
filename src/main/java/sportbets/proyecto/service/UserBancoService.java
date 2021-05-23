package sportbets.proyecto.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sportbets.proyecto.model.UserBanco;
import sportbets.proyecto.model.UserBet;
import sportbets.proyecto.repository.UserBancoRepository;
import sportbets.proyecto.repository.UserBetsRepository;

@Service
public class UserBancoService {
    @Autowired
    private UserBancoRepository userBanco;

    public void actualizarsaldo(UserBanco userB){
        userBanco.actualizarsaldo(userB.getEmail(),userB.getSaldo());
    }
    public String comprobarExiste(UserBanco userB){
        String existe = "No";
        String email = userBanco.comprobarExiste(userB.getEmail());
        if(email!=null)
            existe = "Si";
        return  existe;
    }
    public void crearSaldo(UserBanco userB){
        userBanco.crearSaldo(userB.getEmail(),userB.getSaldo());
    }
    public String obtenerSaldo(String email){
        return userBanco.obtenerSaldo(email);
    }
}
