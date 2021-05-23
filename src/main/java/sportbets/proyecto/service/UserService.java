package sportbets.proyecto.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sportbets.proyecto.model.Usuario;
import sportbets.proyecto.repository.UsuarioRepository;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Service
public class UserService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    private ArrayList<Usuario> usuarios;

    @PostConstruct
    public void init(){
        System.out.println("Iniciado el servicio de usuarios");
    }

    @PreDestroy
    public void destroy(){
        System.out.println("Fuera del servicio de usuarios");
    }

    public String crearUsuario(Usuario user){
        usuarioRepository.createUser(user.getEmail(),user.getPassword(),user.getName(),user.getLastName(),user.getLogo());
        return "Creado";
    }

    public boolean existeUser(String userid){
        boolean existe = false;
        String email = usuarioRepository.getExist(userid);
        if(email!=null)
            existe = true;
        return  existe;
    }

    public String login(String userid, String password) {

        boolean existe = existeUser(userid);

        String user = usuarioRepository.findByUseridAndPassword(userid, password);

        String response="No hay ningun usuario registrado con esta direccion de correo";
        if(existe){
            if(user!=null){
                response="Credenciales correctas";
            }else{
                response="La contraseña no corresponde con esta direccion de correo";
            }

        }
        return response;
    }


    public String getNameUser(String email){

        String nombre = usuarioRepository.getNombre(email);

        return nombre;
    }

    public String usuarioGoogle(Usuario usuario){

        boolean existe;
        existe = existeUser(usuario.getEmail());
        String response = "Ok";
        if(existe){
        }else{
            response = "Send welcome";
            crearUsuario(usuario);
        }

        return response;
    }



}
