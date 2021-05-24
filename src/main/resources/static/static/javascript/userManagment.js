var direccion_ValidUser = '/api/login';
var direccion_SignUpUser = '/api/user/';
var direccion_SignUpUserGoogle = '/api/userGoogle/';
var direccion_NameUser = '/api/user/';

function validUser() {
    var mail = document.getElementById('inputEmail').value;
    var password = document.getElementById('inputPassword').value;
    /*var mail = "user1@gmail.com"
    var password = "user1"*/
    console.log('Preparado para validar usuario');
    console.log(mail);
    console.log(password);
    var url = new URL(direccion_ValidUser)
    var params = [['email', mail], ['password', password]]
    url.search = new URLSearchParams(params).toString();
    fetch(url,
        {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Accept' : 'application/json',
            }
        })
        //Suscribimos a la promesa Response
        .then(res => {
            if(res.ok){
                //Si la respuesta se resolvió bien, procedemos a resolver la promesa Body
                return res.text();
            }else{
                throw res;
            }
        })
        //Suscribimos a la promesa Body
        .then(r => {
            var  wrongPassword = "La contraseña no corresponde con esta direccion de correo"
            var correcto = "Credenciales correctas";
            console.log(r);
            if(r==correcto){
                console.log('ok')
                //localStorage.setItem('nombre', googleUser.getBasicProfile().getGivenName());
                getName(mail)
                localStorage.setItem('logo', "default");
                localStorage.setItem('email', mail);
                window.location='index.html';
            }else if(r==wrongPassword){
                window.location='login.html';
                alert(r);
                console.log('password')
            }else{
                window.location='login.html';
                alert(r);
                console.log('No email')
            }
        })
        //Errores de RED y respuestas KO
        .catch(e => console.log(e))
}

function signUpUser() {
    var name = document.getElementById('user-name').value;
    var lastName = document.getElementById('user-lastname').value;
    var mail = document.getElementById('user-email').value;
    var password = document.getElementById('user-pass').value;
    var data = {"email": mail,
                "password": password,
                "name": name,
                "lastName": lastName,
                "logo": 'default'
    };
    fetch(direccion_SignUpUser,
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
                return res.text()
            }else{
                return res.text();
            }
        })
        //Suscribimos a la promesa Body
        .then(r => {
            console.log(r)
                if(r=="Creado"){
                    localStorage.setItem('logo', "default");
                    localStorage.setItem('email', mail);
                    localStorage.setItem('nombre', name);
                    welcomeEmail(mail)
                    //window.location='index.html';
                }else{
                    alert(r);
                }
        })
        //Errores de RED y respuestas KO
        .catch(e => console.log(e))
}

function signUpUserGoogle(mail,password,name,lastName,logo) {
    var data = {"email": mail,
        "password": password,
        "name": name,
        "lastName": lastName,
        "logo": logo
    };
    fetch(direccion_SignUpUserGoogle,
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
                return res.text()
            }else{
                return res.text();
            }
        })
        //Suscribimos a la promesa Body
        .then(r => {
            if(r=="Send welcome"){
                welcomeEmail(mail);
                console.log('Bienvenenida al nuevo usuario')
            }else
                welcomeEmail(mail);
                console.log('Ya registrado');
        })
        //Errores de RED y respuestas KO
        .catch(e => console.log(e))
}

function getName(mail) {

    var url = direccion_NameUser+mail
    fetch(url,
        {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Accept' : 'application/json',
            }
        })
        //Suscribimos a la promesa Response
        .then(res => {
            if(res.ok){
                //Si la respuesta se resolvió bien, procedemos a resolver la promesa Body
                return res.text();
            }else{
                throw res;
            }
        })
        //Suscribimos a la promesa Body
        .then(r => {
            //console.log("nombre"+r)
            localStorage.setItem('nombre', r);
        })
        //Errores de RED y respuestas KO
        .catch(e => console.log(e))
}