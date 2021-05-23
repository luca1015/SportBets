package sportbets.proyecto.repository;

import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import sportbets.proyecto.model.MatchBet;

import java.util.List;

public interface MatchBetRepository extends CrudRepository<MatchBet,String> {
    @Modifying
    @Transactional
    @Query("INSERT INTO matchesbet (idbet,idmatch,team,cuota) VALUES(:idbet,:idmatch,:team,:cuota);")
    String saveMatchBet(@Param("idbet") String idbet, @Param("idmatch") String idmatch, @Param("team") String team, @Param("cuota") String cuota );
    @Query("SELECT idmatch,team,cuota FROM matchesbet WHERE idbet=:idbet")
    List<MatchBet> getPartidos(@Param("idbet") String idbet);
    @Modifying
    @Transactional
    @Query("DELETE FROM matchesbet")
    String borrarApuestas();
}
