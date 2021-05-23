package sportbets.proyecto.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

@Service
public class SendEmailService {


    //Importante hacer la inyección de dependencia de JavaMailSender:
    @Autowired
    private JavaMailSender mailSender;

    @PostConstruct
    public void init(){
        System.out.println("Iniciado el servicio de envio de correos");
    }

    @PreDestroy
    public void destroy(){
        System.out.println("Fuera del servicio de envio de correos");
    }

    public void sendWelcomeEmail(String to){
        String content = "Gracias. Ya estás en nuestra lista de envío de correo y ahora serás de l@s primer@s en escuchar sobre nuestras nuevas apuestas, " +
                "eventos especiales y ofertas exclusivas. Como un obsequio especial, disfruta de un descuento de 5% en tu próxima apuesta en tienda y en nuestra pagina web.";
        String subject = "Bienvenid@ a Sportbets";
        sendEmail(to,content,subject);
    }

    public void sendSupportEmail(String to, String issue){
        String content = "Sentimos los problemas ocasionados, nos pondremos en contacto con usted cuando se haya solucionado el fallo.";
        String subject = issue;
        sendEmail(to,content,subject);
    }
    public void sendForgetPasswordEmail(String to){
        String content = "¿Has olvidado tu contraseña? ¡No te preocupes! Puedes mandarnos un email con la nueva contraseña.";
        String subject = "Forget Password?";
        sendEmail(to,content,subject);
    }

    public void sendEmail(String to,String content, String subject) {

        SimpleMailMessage email = new SimpleMailMessage();

        email.setTo(to);
        email.setSubject(subject);
        email.setText(content);

        mailSender.send(email);
    }
}
