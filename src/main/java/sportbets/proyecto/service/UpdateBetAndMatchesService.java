package sportbets.proyecto.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import sportbets.proyecto.model.MatchBet;
import sportbets.proyecto.model.Partido;
import sportbets.proyecto.model.UserBanco;
import sportbets.proyecto.model.UserBet;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
@Slf4j
public class UpdateBetAndMatchesService {
    @Autowired
    MatchService matchService;

    @Autowired
    UserBetsService userBetsService;

    @Autowired
    MatchBetService matchBetService;

    @Autowired
    UserBancoService banco;

    //POSTERIRORMENTE HABRA QUE IR ACTUALIZANDO EL STATUS DE UN EVENTO CUANDO FINALICE  EN NUESTRA BASE DE DATOS
    @Scheduled(fixedRate = 5000) //CADA 5 SEGUNDOS
    public void updateEventosAndBets() throws ParseException {
        //Contenido base de datos
        List<Partido> result = matchService.actualizarFechasPartidos();
        for(Partido match : result)
        {
            Date fechaIni = crearStringFecha(match.getDateini());
            Date fechaFin = crearStringFecha(match.getDatefini());
            Date fechaActual = new Date();
            boolean iniciado = fechaIni.before(fechaActual);
            boolean finalizado = fechaFin.before(fechaActual);
            String status = match.getStatus();
            String id = match.getId();
            if(finalizado){
                if(status.equals("SCHEDULED") || status.equals("PLAYING")){
                    matchService.cambiarStatus(id,"FINISHED");
                }
            }else if(iniciado && finalizado==false){
                if(status.equals("SCHEDULED") || status.equals("FINISHED")){
                    matchService.cambiarStatus(id,"PLAYING");
                }
            }else{
                if(status.equals("PLAYING") || status.equals("FINISHED")){
                    matchService.cambiarStatus(id,"SCHEDULED");
                }
            }
        }
    }

    @Scheduled(fixedRate = 15000) //CADA 15 SEGUNDOS
    public void updateBets() throws ParseException {
        //Contenido base de datos
        List<UserBet> result = userBetsService.getBets();
        for(UserBet bet : result)
        {
            String email = bet.getEmail();
            String id = bet.getId_bet();
            List<MatchBet> partidos = matchBetService.getPartidos(id);
            boolean finalizado = true;
            boolean ganada = true;
            float multiplicador = 1;
            for(MatchBet match : partidos)
            {
                String id_match = match.getIdmatch();
                Partido matchInfo = matchService.getPartidosInfo(id_match);
                String team_bet = match.getTeam();
                String winner = matchInfo.getWinner();
                String fechafin = matchInfo.getDatefini();
                Date now = new Date();
                Date fechaFin = crearStringFecha(fechafin);
                float cuota = Float.parseFloat(match.getCuota());
                multiplicador = multiplicador*cuota;
                boolean fin = fechaFin.before(now);
                if(fin){
                    if(winner.equals(team_bet)){

                    }else{
                        ganada = false;
                    }
                }else{
                    finalizado=false;
                }
            }
            if(finalizado){
                userBetsService.cambiarStatus(id,"FINISHED");
                if(ganada){
                    UserBanco userBanco = new UserBanco();
                    userBanco.setEmail(email);
                    float saldo_antiguo = Float.parseFloat(banco.obtenerSaldo(userBanco.getEmail()));
                    float saldo_nuevo = saldo_antiguo+multiplicador;
                    userBanco.setSaldo(Float.toString(saldo_nuevo));
                    banco.actualizarsaldo(userBanco);
                }
            }
        }
    }

    public Date crearStringFecha(String fechaMala){
        int anio = Integer.parseInt(fechaMala.substring(0,4))-1900;
        int mes = Integer.parseInt(fechaMala.substring(5,7))-1;
        int dia = Integer.parseInt(fechaMala.substring(8,10));
        int hora = Integer.parseInt(fechaMala.substring(11,13))+2;
        int minuto = Integer.parseInt(fechaMala.substring(14,16));
        Date fecha = new Date(anio,mes,dia,hora,minuto,0);
        return fecha;
    }


}
