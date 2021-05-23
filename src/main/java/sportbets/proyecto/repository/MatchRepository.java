package sportbets.proyecto.repository;

import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import sportbets.proyecto.model.Partido;
import sportbets.proyecto.model.Usuario;

import java.util.List;

public interface MatchRepository extends CrudRepository<Partido,String> {
    @Modifying
    @Transactional
    @Query("INSERT INTO partidos (id,local,visitante,clocal,empate,cvisitante,dateini,datefini,result,status,winner,pais) VALUES(:id,:local,:visitante,:clocal,:empate,:cvisitante,:dateini,:datefini,:result,:status,:winner,:pais);")
    String createMatch(@Param("id") String id, @Param("local") String local, @Param("visitante") String visitante, @Param("clocal") String clocal, @Param("empate") String empate,@Param("cvisitante") String cvisitante,@Param("dateini") String dateini,@Param("datefini") String datefini,@Param("result") String result,@Param("status") String status,@Param("winner") String winner,@Param("pais") String pais);
    @Modifying
    @Transactional
    @Query("DELETE FROM partidos WHERE pais=:pais")
    String borrarLiga(@Param("pais") String pais);
    @Query("SELECT id,dateini,datefini,status FROM partidos ORDER BY pais,dateini")
    List<Partido> actualizarFechasPartidos();
    @Modifying
    @Transactional
    @Query("UPDATE partidos SET status=:status WHERE id=:id")
    String cambiarStatus(@Param("id") String id,@Param("status") String status);
    @Query("SELECT * FROM partidos WHERE status=:status AND pais=:pais ORDER BY dateini ASC LIMIT 20")
    List<Partido> getPartidosBaseDatos(@Param("pais") String pais,@Param("status") String status);

    @Query("SELECT * FROM partidos WHERE id=:id")
    Partido getPartidosInfo(@Param("id") String id);

}
