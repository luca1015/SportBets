package sportbets.proyecto.repository;

import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import sportbets.proyecto.model.Partido;
import sportbets.proyecto.model.UserBet;

import java.util.List;

public interface UserBetsRepository extends CrudRepository<UserBet,String> {
    @Modifying
    @Transactional
    @Query("INSERT INTO userbets (id_bet,email,status) VALUES(:id_bet,:email,:status);")
    String createUser(@Param("email") String userid, @Param("id_bet") String id_bet, @Param("status") String status);
    @Query("SELECT id_bet,email FROM userbets WHERE status=:status")
    List<UserBet> getBets(@Param("status") String status);
    @Query("SELECT id_bet,email,status FROM userbets WHERE email=:email")
    List<UserBet> getAllBets(@Param("email") String email);
    @Modifying
    @Transactional
    @Query("UPDATE userbets SET status=:status WHERE id_bet=:id_bet")
    String cambiarStatus(@Param("id_bet") String id_bet, @Param("status") String status);
    @Modifying
    @Transactional
    @Query("DELETE FROM userbets")
    String borrarApuestas();
}
