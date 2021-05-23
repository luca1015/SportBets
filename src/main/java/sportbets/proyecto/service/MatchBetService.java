package sportbets.proyecto.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sportbets.proyecto.model.MatchBet;
import sportbets.proyecto.model.UserBet;
import sportbets.proyecto.repository.MatchBetRepository;
import sportbets.proyecto.repository.UserBetsRepository;

import java.util.List;

@Service
public class MatchBetService {
    @Autowired
    private MatchBetRepository matchBetRepository;

    public void saveMatchBet(MatchBet matchBet){
        matchBetRepository.saveMatchBet(matchBet.getIdbet(),matchBet.getIdmatch(),matchBet.getTeam(),matchBet.getCuota());
    }
    public List<MatchBet> getPartidos(String id){
        return matchBetRepository.getPartidos(id);
    }
    public void borrarApuestas(){
        matchBetRepository.borrarApuestas();
    }
}
