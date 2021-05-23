var direccion_apuestaUser = 'http://localhost:8080/api/bets/';
var direccion_actualizarSaldo = 'http://localhost:8080/api//user/bank';
var direccion_partidoApuesta = 'http://localhost:8080/api/users/bets/match/';
var direccion_obtenerSaldo = 'http://localhost:8080/api/user/';
var direccion_comprobarExiste = 'http://localhost:8080/api/user/bank/login';
function generarApuesta() {
    var email = localStorage.getItem('email')
    var ids = getIds()
    var cuotas = getCuotas()
    var partidos_bet = getMatchesBet()
    console.log(partidos_bet)
    console.log(cuotas)
    var id_apuesta = uuid.v1()
    var dinero = document.getElementById('cantidad-apostada').value
    if(dinero<0 || dinero==""){
        dinero=1;
    }
    if(email==null) {
        alert("POR FAVOR DEBE INICIAR SESION ANTES DE REALIZAR APUESTAS")
    }else if(ids.length==0){
        alert("POR FAVOR DEBE SELECCIONAR ALGUN EVENTO")
    }else {
        actualizarSaldo2(email, id_apuesta, ids, dinero,cuotas,partidos_bet);
    }
}

function actualizarSaldo2(email, id_apuesta, ids, dinero,cuotas,partidos_bet){
    var data = {
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
                obtenerSaldoUser2(email,id_apuesta,ids,dinero,cuotas,partidos_bet)
            }else{
                alert("Debe introducir un metodo de pago")
            }
        })
        //Errores de RED y respuestas KO
        .catch(e => console.log(e))
}

function obtenerSaldoUser2(email,id_apuesta,ids,dinero,cuotas,partidos_bet){
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
            if(r==null || r=="")
                r=0;
            var saldo = parseFloat(r);
            console.log(saldo)
            var dinero2 = parseFloat(dinero)
            console.log(dinero2)
            var dinero3 = saldo-dinero2;
            if(dinero2>saldo)
                alert("NO HAY SUFICIENTE DINERO PARA REALIZAR ESTA APUESTA")
            else
                actualizarSaldoUser2(email,id_apuesta,ids,dinero3,cuotas,partidos_bet)
        })
        //Errores de RED y respuestas KO
        .catch(e => console.log(e))
}

function actualizarSaldoUser2(email,id_apuesta,ids,dinero3,cuotas,partidos_bet){

    var data = {"saldo": dinero3,
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
            guardarApuesta(email,ids,id_apuesta,cuotas,partidos_bet);
        })
        //Errores de RED y respuestas KO
        .catch(e => console.log(e))
}

function guardarApuesta(email,ids,id_apuesta,cuotas,partidos_bet){
    var data = {"email": email,
        "id_bet": id_apuesta
    };
    fetch(direccion_apuestaUser,
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
            for (let step = 0; step < ids.length; step++){
                let id_match = ids[step]
                let cuota = cuotas[step]
                let partido = partidos_bet[step]
                guardarPartidoApuesta(id_match,id_apuesta,cuota,partido)
            }
            alert("APUESTA REALIZA CORRECTAMENTE")
            window.location = "Bets.html"
            //console.log(r)
        })
        //Errores de RED y respuestas KO
        .catch(e => console.log(e))
}

function guardarPartidoApuesta(id_match,id_apuesta,cuota,partido){
    var data = {"idmatch": id_match,
        "cuota": cuota,
        "team" : partido,
        "idbet": id_apuesta
    };
    fetch(direccion_partidoApuesta,
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
            //console.log(r)
        })
        //Errores de RED y respuestas KO
        .catch(e => console.log(e))
}