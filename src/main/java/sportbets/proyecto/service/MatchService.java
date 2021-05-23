package sportbets.proyecto.service;

import sportbets.proyecto.model.MatchListService;
import sportbets.proyecto.model.Partido;

import java.util.List;

public interface MatchService{

    public MatchListService getPartidosEspania();
    public MatchListService getPartidosInglaterra();
    public MatchListService getPartidosItalia();
    public MatchListService getPartidosAlemania();
    public MatchListService getPartidosFrancia();
    public MatchListService getPartidosChampions();
    public MatchListService getPartidos(String url);
    public void guardarPartido(Partido match);
    public void resetearLiga(String liga);
    public List<Partido> actualizarFechasPartidos();
    public void cambiarStatus(String id, String status);
    public List<Partido> getPartidosBaseDatos(String pais);
    public Partido getPartidosInfo(String id);

}
