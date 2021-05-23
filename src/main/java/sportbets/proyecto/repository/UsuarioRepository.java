package sportbets.proyecto.repository;

import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import sportbets.proyecto.model.Usuario;

public interface UsuarioRepository extends CrudRepository<Usuario,String> {

    @Query("SELECT name FROM usuarios WHERE email= :email AND password= :password")
    String findByUseridAndPassword(@Param("email") String userid, @Param("password") String password);

    @Query("SELECT name FROM usuarios WHERE email= :email")
    String getNombre(@Param("email") String userid);

    @Query("SELECT email FROM usuarios WHERE email= :email")
    String getExist(@Param("email") String userid);

    @Modifying
    @Transactional
    @Query("INSERT INTO usuarios (email,password,name,lastname,logo) VALUES(:email,:password,:name,:lastname,:logo);")
    String createUser(@Param("email") String userid, @Param("password") String password, @Param("name") String name, @Param("lastname") String lastname,@Param("logo") String logo);


}
