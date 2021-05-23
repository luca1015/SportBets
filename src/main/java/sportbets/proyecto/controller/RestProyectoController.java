package sportbets.proyecto.controller;

import lombok.extern.slf4j.Slf4j;
import net.minidev.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import sportbets.proyecto.model.*;
import sportbets.proyecto.service.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api")
@Slf4j
public class RestProyectoController {

    @Autowired
    private MatchService football;

    @Autowired
    private SendEmailService sendEmailService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserBetsService userBetsService;

    @Autowired
    private MatchBetService matchBetService;

    @Autowired
    private UserBancoService userBancoService;

    @PostMapping("/sendWelcomeEmail")
    public ResponseEntity<String> sendWelcomeEmail(@RequestBody @Valid Email email){
        sendEmailService.sendWelcomeEmail(email.getEmail());
        return new ResponseEntity<>(HttpStatus.OK);
    }
    @PostMapping("/sendSupportEmail")
    public ResponseEntity<String> sendSupportEmail(@RequestBody @Valid Email mail){
        sendEmailService.sendSupportEmail(mail.getEmail(),mail.getIssue());
        return new ResponseEntity<>("OK",HttpStatus.OK);
    }
    @PostMapping("/sendForgetPasswordEmail")
    public ResponseEntity<String> sendForgetPasswordEmail(@RequestBody Email mail){
        sendEmailService.sendForgetPasswordEmail(mail.getEmail());
        return new ResponseEntity<>("OK",HttpStatus.OK);
    }
    @GetMapping("/login")
    public ResponseEntity<String> login(@RequestParam("email") String email,@RequestParam("password") String password){
        String existe = userService.login(email,password);
        ResponseEntity<String> respuesta = new ResponseEntity<String>(existe, HttpStatus.OK);
        return respuesta;
    }
    @GetMapping("/user/{email}")
    public ResponseEntity<String> getUsuario(@PathVariable String email){
        String nombre = userService.getNameUser(email);
        ResponseEntity<String> respuesta = new ResponseEntity<String>(nombre, HttpStatus.OK);
        return respuesta;
    }
    @PostMapping("/userGoogle/")
    public ResponseEntity<String> usuarioGoogle(@RequestBody @Valid Usuario user){
        String response = userService.usuarioGoogle(user);
        ResponseEntity<String> respuesta = new ResponseEntity<String>(response , HttpStatus.OK);
        return respuesta;
    }
    @PostMapping("/user/")
    public ResponseEntity<String> crearUsuario(@RequestBody @Valid Usuario user){
        userService.crearUsuario(user);
        ResponseEntity<String> respuesta = new ResponseEntity<String>("Creado" , HttpStatus.OK);
        return respuesta;
    }
    @GetMapping("/partidosExterno/{liga}")
    public ResponseEntity<MatchListService> getExternMatches(@PathVariable String liga){
        if(liga.equals("SP"))
            return new ResponseEntity<MatchListService>(football.getPartidosEspania(), HttpStatus.OK);
        else if(liga.equals("IN"))
            return new ResponseEntity<MatchListService>(football.getPartidosInglaterra(), HttpStatus.OK);
        else if(liga.equals("IT"))
            return new ResponseEntity<MatchListService>(football.getPartidosItalia(), HttpStatus.OK);
        else if(liga.equals("FR"))
            return new ResponseEntity<MatchListService>(football.getPartidosFrancia(), HttpStatus.OK);
        else if(liga.equals("CL"))
            return new ResponseEntity<MatchListService>(football.getPartidosChampions(), HttpStatus.OK);
        else
            return new ResponseEntity<MatchListService>(HttpStatus.METHOD_NOT_ALLOWED);
    }

    @DeleteMapping("/bets")
    public ResponseEntity<String> borrarApuesta(){
        userBetsService.borrarApuesta();
        matchBetService.borrarApuestas();
        ResponseEntity<String> respuesta = new ResponseEntity<String>("Apuestas eliminadas" , HttpStatus.OK);
        return respuesta;
    }
    @PostMapping("/matches/")
    public ResponseEntity<String> guardarPartido(@RequestBody Partido match){
        football.guardarPartido(match);
        ResponseEntity<String> respuesta = new ResponseEntity<String>("Creado" , HttpStatus.OK);
        return respuesta;
    }
    @DeleteMapping("/ligues/{liga}")
    public ResponseEntity<String> resetearLiga(@PathVariable String liga){
        football.resetearLiga(liga);
        ResponseEntity<String> respuesta = new ResponseEntity<String>("Borrado" , HttpStatus.OK);
        return respuesta;
    }

    @GetMapping("/matches/{liga}")
    public ResponseEntity<Object> infoMatch(@PathVariable String liga){
        List<Partido> matches = football.getPartidosBaseDatos(liga);
        List<JSONObject> entities = new ArrayList<JSONObject>();

        for(Partido match : matches){
            JSONObject entity = new JSONObject();
            String enfrentamiento = match.getLocal()+" vs "+match.getVisitante();
            entity.put("enfrentamiento", enfrentamiento);
            entity.put("fechaInicio", match.getDateini());
            entity.put("fechaFin", match.getDatefini());
            entity.put("cuota1", match.getClocal());
            entity.put("cuotaX", match.getEmpate());
            entity.put("cuota2", match.getCvisitante());
            entity.put("id", match.getId());
            entities.add(entity);
        }
        return new ResponseEntity<Object>(entities, HttpStatus.OK);
    }
    @GetMapping("/user/{email}/bets")
    public ResponseEntity<Object> getUserBets(@PathVariable String email){
        List<UserBet> result = userBetsService.getAllBets(email);
        List<JSONObject> apuestas_json = new ArrayList<JSONObject>();
        //Se devuelven las apuestas y cada apuesta con sus respectivos partidos
        for(UserBet bet : result)
        {
            JSONObject apuesta = new JSONObject();
            String status_bet = bet.getStatus();
            String id_bet = bet.getId_bet();
            log.info(status_bet);
            log.info(id_bet);
            List<MatchBet> matchesBet = matchBetService.getPartidos(bet.getId_bet());
            apuesta.put("status_bet",status_bet);
            apuesta.put("id_bet",id_bet);
            List<JSONObject> paritdos_json = new ArrayList<JSONObject>();
            for(MatchBet match : matchesBet)
            {
                JSONObject entity = new JSONObject();
                String team_bet = match.getTeam();
                String id_match = match.getIdmatch();
                Partido matchInfo = football.getPartidosInfo(id_match);
                String enfrentamiento = matchInfo.getLocal()+" vs "+matchInfo.getVisitante();
                String winner = matchInfo.getWinner();
                float cuota = Float.parseFloat(match.getCuota());
                String status_match = matchInfo.getStatus();
                entity.put("team_bet",team_bet);
                entity.put("enfrentamiento",enfrentamiento);
                entity.put("winner",winner);
                entity.put("cuota",cuota);
                entity.put("status",status_match);
                paritdos_json.add(entity);
            }
            apuesta.put("partidos",paritdos_json);
            apuestas_json.add(apuesta);
        }
        return new ResponseEntity<Object>(apuestas_json, HttpStatus.OK);
    }
    @PostMapping("/bets/")
    public ResponseEntity<String> saveBet(@RequestBody UserBet userBet){
        userBetsService.saveBet(userBet);
        ResponseEntity<String> respuesta = new ResponseEntity<String>("Ok" , HttpStatus.OK);
        return respuesta;
    }
    @PostMapping("users/bets/match/")
    public ResponseEntity<String> saveMatchBet(@RequestBody MatchBet matchBet){
        matchBetService.saveMatchBet(matchBet);
        ResponseEntity<String> respuesta = new ResponseEntity<String>("Ok" , HttpStatus.OK);
        return respuesta;
    }
    @GetMapping("/user/{email}/bank")
    public ResponseEntity<String> obtenerSaldo(@PathVariable String email){
        String response = userBancoService.obtenerSaldo(email);
        ResponseEntity<String> respuesta = new ResponseEntity<String>(response , HttpStatus.OK);
        return respuesta;
    }
    @PutMapping("/user/bank")
    public ResponseEntity<String> actualizarsaldo(@RequestBody UserBanco userBanco){
        ResponseEntity<String> respuesta = new ResponseEntity<String>("Ok" , HttpStatus.OK);
        if(Float.parseFloat(userBanco.getSaldo())<0)
            respuesta = new ResponseEntity<String>("Saldo no válido" , HttpStatus.BAD_REQUEST);
        else
            userBancoService.actualizarsaldo(userBanco);
        return respuesta;
    }
    @PostMapping("/user/bank/login")
    public ResponseEntity<String> comprobarExiste(@RequestBody UserBanco userBanco){
        String response = userBancoService.comprobarExiste(userBanco);
        ResponseEntity<String> respuesta = new ResponseEntity<String>(response , HttpStatus.OK);
        return respuesta;
    }
    @PostMapping("/user/bank/")
    public ResponseEntity<String> crearSaldo(@RequestBody UserBanco userBanco){
        userBancoService.crearSaldo(userBanco);
        ResponseEntity<String> respuesta = new ResponseEntity<String>("Ok" , HttpStatus.OK);
        return respuesta;
    }


}
