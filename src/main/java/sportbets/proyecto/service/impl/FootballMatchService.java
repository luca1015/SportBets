package sportbets.proyecto.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;
import sportbets.proyecto.model.MatchListService;
import sportbets.proyecto.model.Partido;
import sportbets.proyecto.repository.MatchRepository;
import sportbets.proyecto.service.MatchService;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.util.List;

@Service("football")
public class FootballMatchService implements MatchService {

    @Autowired
    MatchRepository matchRepository;

    @Value("${partidosEspania.url}")
    private String url_sp;
    @Value("${partidosInglaterra.url}")
    private String url_in;
    @Value("${partidosItalia.url}")
    private String url_it;
    @Value("${partidosAlemania.url}")
    private String url_al;
    @Value("${partidosFrancia.url}")
    private String url_fr;
    @Value("${partidosChampions.url}")
    private String url_cl;

    @PostConstruct
    public void init(){
        System.out.println("Iniciado el servicio de partidos");
    }

    @PreDestroy
    public void destroy(){
        System.out.println("Fuera del servicio de partidos");
    }

    public MatchListService getPartidosEspania(){
        return getPartidos(url_sp);
    }
    public MatchListService getPartidosInglaterra(){
        return getPartidos(url_in);
    }
    public MatchListService getPartidosItalia(){
        return getPartidos(url_it);
    }
    public MatchListService getPartidosAlemania(){
        return getPartidos(url_al);
    }
    public MatchListService getPartidosFrancia(){
        return getPartidos(url_fr);
    }
    public MatchListService getPartidosChampions(){
        return getPartidos(url_cl);
    }

    public MatchListService getPartidos(String url){

        final RestTemplate template = new RestTemplate();
        final HttpMethod method = HttpMethod.GET;
        final HttpHeaders headers = new HttpHeaders();
        headers.set("X-Auth-Token", "d962f8a6ede5406e99d1cb479b832094");
        final HttpEntity<String> responseEntity = new HttpEntity<>(headers);
        final ResponseEntity<MatchListService> response = template.exchange(url, method, responseEntity , MatchListService.class);

        return response.getBody();
    }

    public void guardarPartido(Partido match){
        matchRepository.createMatch(match.getId(), match.getLocal(), match.getVisitante(), match.getClocal(), match.getEmpate(), match.getCvisitante(), match.getDateini(), match.getDatefini(), match.getResult(), match.getStatus(), match.getWinner(),match.getPais());
    }
    public void resetearLiga(String liga){
        matchRepository.borrarLiga(liga);
    }
    public List<Partido> actualizarFechasPartidos(){
        return matchRepository.actualizarFechasPartidos();
    }
    public void cambiarStatus(String id, String status){
        String nada = matchRepository.cambiarStatus(id,status);
    }

    public List<Partido> getPartidosBaseDatos(String pais){
        String status = "SCHEDULED";
        return matchRepository.getPartidosBaseDatos(pais,status);
    }

    public Partido getPartidosInfo(String id){
        return matchRepository.getPartidosInfo(id);
    }

}
