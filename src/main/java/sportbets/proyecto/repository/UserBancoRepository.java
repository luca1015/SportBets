package sportbets.proyecto.repository;

import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import sportbets.proyecto.model.UserBanco;

public interface UserBancoRepository extends CrudRepository<UserBanco,String> {
    @Query("SELECT email FROM userbanco WHERE email= :email")
    String comprobarExiste(@Param("email") String email);
    @Query("SELECT saldo FROM userbanco WHERE email= :email")
    String obtenerSaldo(@Param("email") String email);
    @Modifying
    @Transactional
    @Query("INSERT INTO userbanco (email,saldo) VALUES(:email,:saldo);")
    String crearSaldo(@Param("email") String email, @Param("saldo") String saldo);
    @Modifying
    @Transactional
    @Query("UPDATE userbanco SET saldo=:saldo WHERE email=:email")
    String actualizarsaldo(@Param("email") String email, @Param("saldo") String saldo);
}
