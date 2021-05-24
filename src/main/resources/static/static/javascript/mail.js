var direccion = '/api/sendWelcomeEmail';
var direccion2 = '/api/sendSupportEmail';
var direccion3 = '/api/sendForgetPasswordEmail';

function welcomeEmail(mail) {
    console.log('Preparado para enviar correo de bienvenida');
    var data = {"email": mail};
    fetch(direccion,
        {
            method: 'POST',
            body: JSON.stringify(data),
            headers: {
                'Content-Type': 'application/json',
                'Accept' : 'application/json',
            }
        })
        //Suscribimos a la promesa Response
        .then(res => {
            if(res.ok){
                //Si la respuesta se resolvió bien, procedemos a resolver la promesa Body
                return res
            }else{
                console.log('NO SE ENCUENTRA LA DIRECCION DE CORREO')
                throw res;
            }
        })
        //Suscribimos a la promesa Body
        .then(r => {
        })
        //Errores de RED y respuestas KO
        .catch(e => console.log(e))
}

function forgetPassword(){
    var mail = document.getElementById('resetEmail').value
    console.log(mail)
    console.log('Preparado para enviar correo de olvido de contraseña');
    var data = {"email": mail};
    fetch(direccion3,
        {
            method: 'POST',
            body: JSON.stringify(data),
            headers: {
                'Content-Type': 'application/json',
                'Accept' : 'application/json',
            }
        })
        //Suscribimos a la promesa Response
        .then(res => {
            if(res.ok){
                //Si la respuesta se resolvió bien, procedemos a resolver la promesa Body
                alert('Se ha enviado un correo electronico para restrablecer su contraseña')
                window.location='login.html'
                return res
            }else{
                alert('NO EXISTE LA DIRECCION DE CORREO')
                throw res;
            }
        })
        //Suscribimos a la promesa Body
        .then(r => {
        })
        //Errores de RED y respuestas KO
        .catch(e => console.log(e))
}

function supportEmail(email,issue) {
    console.log('Preparado para enviar correo de ayuda');
    var data = {"email": email,
                "issue": issue};
    fetch(direccion2,
        {
            method: 'POST',
            body: JSON.stringify(data),
            headers: {
                'Content-Type': 'application/json',
                'Accept' : 'application/json',
            }
        })
        //Suscribimos a la promesa Response
        .then(res => {
            if(res.ok){
                //Si la respuesta se resolvió bien, procedemos a resolver la promesa Body
                return res
            }else{
                console.log('NO SE ENCUENTRA LA DIRECCION DE CORREO')
                throw res;
            }
        })
        //Suscribimos a la promesa Body
        .then(r => {
        })
        //Errores de RED y respuestas KO
        .catch(e => console.log(e))
}