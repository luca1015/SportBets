package sportbets.proyecto.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sportbets.proyecto.model.UserBet;
import sportbets.proyecto.repository.UserBetsRepository;

import java.util.List;

@Service
public class UserBetsService {
    @Autowired
    private UserBetsRepository userBets;

    public void saveBet(UserBet userB){
        userBets.createUser(userB.getEmail(), userB.getId_bet(), "PENDING");
    }
    public List<UserBet> getBets(){
        return userBets.getBets("PENDING");
    }
    public List<UserBet> getAllBets(String email){
        return userBets.getAllBets(email);
    }
    public void cambiarStatus(String id_bet, String status){
        userBets.cambiarStatus(id_bet, status);
    }
    public void borrarApuesta(){
        userBets.borrarApuestas();
    }
}
