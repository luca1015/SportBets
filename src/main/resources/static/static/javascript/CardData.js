var direccion_actualizarSaldo = '/api/user/bank';
var direccion_comprobarExiste = '/api//user/bank/login';
var direccion_crearSaldo = '/api/user/bank/';
var direccion_obtenerSaldo = '/api/user/';

!(function (a) {
    a(function () {
        a(".button-sent #back").hide(),
        a(".button-sent #saldo").hide(),
        a(".button-sent #continue").click(function (b) {
            a("#area .master-card").css("transform", "rotateY(180deg)"),
            a(".button-sent #back").show(),
            a(".button-sent #saldo").show(),
            a(".button-sent #continue").hide();
        }),
        a(".button-sent #back").click(function (b) {
            a("#area .master-card").css("transform", "rotateY(0deg)"),
            a(".button-sent #back").hide(),
            a(".button-sent #continue").show(),
            a(".button-sent #saldo").hide();
        }),
        a(".button-sent #saldo").click(function (b) {
            a("#area .saldo").css("transform", "rotateY(180deg)"),
            a(".button-sent #continue").hide(),
            a(".button-sent #back").hide();

        });
    });
})(jQuery);

function cargarSaldo(){
    var estado_local = getEstado()
    if(estado_local == 0) {
        console.log("1")
        var card = document.getElementById("master-card");
        card.innerHTML = "<div class=\"saldo\" id=\"saldo\">" +
            "           <div class=\"botones-saldo\">" +
            "               <div class=\"botones-saldo-arriba\">" +
            "                   <button class=\"boton-1\" id=\"boton-1\" onclick=\"updateSaldo1()\">1€</button>" +
            "                   <button class=\"boton-5\" id=\"boton-5\" onclick=\"updateSaldo5()\">5€</button>" +
            "               </div>" +
            "               <br>" +
            "               <br>" +
            "               <div class=\"botones-saldo-abajo\">" +
            "                   <button class=\"boton-10\" id=\"boton-10\" onclick=\"updateSaldo10()\">10€</button>" +
            "                   <button class=\"boton-20\" id=\"boton-20\" onclick=\"updateSaldo20()\">20€</button>" +
            "               </div>" +
            "               <br>" +
            "               <br>" +
            "               <div class=\"introducir-saldo\">" +
            "                    <input id=\"saldo-elegido\" type=\"text\" class=\"form-control\"" +
            "                     placeholder=\"Saldo superior\" aria-label=\"saldo-consumo\">" +
            "               </div>" +
            "           </div>" +
            "           </div>";
    }else{
        console.log("2")
        recargar();
    }
    setEstado(1)
}

var estado = 0;

function getEstado() {
    return estado;
}
function setEstado(estado2) {
    estado = estado2;
}

function updateSaldo1(){
    document.getElementById("saldo-elegido").value = "1€";
}
function updateSaldo5(){
    document.getElementById("saldo-elegido").value = "5€";
}
function updateSaldo10(){
    document.getElementById("saldo-elegido").value = "10€";
}
function updateSaldo20(){
    document.getElementById("saldo-elegido").value = "20€";
}
function cargarNombre() {
    cargarBarraNavegacion();
    document.getElementById("nombre-user").innerHTML = localStorage.getItem('nombre');
}
function recargar() {

    var saldo = document.getElementById("saldo-elegido").value;
    saldo = saldo.replace('€', '');
    var dato = saldo;
    var valoresAceptados = /^[0-9]+$/;
    var nombre = localStorage.getItem('nombre');
    var email = localStorage.getItem('email');
    if(nombre==null){
        alert("Debe iniciar sesion previamente")
    }else if(saldo=="") {
        alert("Introduzca un saldo")
    }else{
        if (dato.match(valoresAceptados)){
            actualizarSaldo(saldo,email)
        } else {
            alert ("Introduzca un numero entero");
        }
    }
}

function actualizarSaldo(saldo,email){
    var data = {"saldo": saldo,
        "email": email
    };
    fetch(direccion_comprobarExiste,
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
            if(r=="Si"){
                obtenerSaldoUser(saldo,email)
            }else{
                crearUserBanco(saldo,email)
            }
        })
        //Errores de RED y respuestas KO
        .catch(e => console.log(e))
}

function crearUserBanco(saldo,email){
    var data = {"saldo": saldo,
        "email": email
    };
    fetch(direccion_crearSaldo,
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
            alert("SE HA ACTUALIZADO SU SALDO CORRECTAMENTE")
        })
        //Errores de RED y respuestas KO
        .catch(e => console.log(e))
}

function obtenerSaldoUser(saldo,email){
    var address = direccion_obtenerSaldo+email+"/bank"
    fetch(address,
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
                return res.text()
            }else{
                return res.text();
            }
        })
        //Suscribimos a la promesa Body
        .then(r => {
            console.log("Aqui")
            console.log(saldo)
            console.log(r)
            if(r==null)
                r=0;
            var nuevo_saldo = parseFloat(saldo)+parseFloat(r);
            console.log(nuevo_saldo)
            actualizarSaldoUser(nuevo_saldo,email)
        })
        //Errores de RED y respuestas KO
        .catch(e => console.log(e))
}

function actualizarSaldoUser(saldo,email){
    var data = {"saldo": saldo,
        "email": email
    };
    fetch(direccion_actualizarSaldo,
        {
            method: 'PUT',
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
            alert("SE HA ACTUALIZADO SU SALDO CORRECTAMENTE")
            window.location = "CardData.html"
        })
        //Errores de RED y respuestas KO
        .catch(e => console.log(e))
}