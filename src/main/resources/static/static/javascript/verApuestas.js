var address_bets='/api/user/';
function cargarApuestas() {
    cargarBarraNavegacion()
    var email = localStorage.getItem('email');
    if(email==null){
        alert("DEBE VOLVER A INICIAR SESION")
        window.location.href="index.html"

    }else{
        var url = address_bets+email+"/bets"
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
                    return res.json()
            })
            //Suscribimos a la promesa Body
            .then(r => {
                console.log(r)
                for (let step = 0; step < r.length; step++) {
                    var id_bet = r[step].id_bet;
                    id_bet = id_bet.substr(0,5);
                    var status2 = r[step].status_bet;
                    var addBet =""
                    var addBet3 ="";
                    var total = 1;
                    var ganada = true;
                    for (let step2 = 0; step2 < r[step].partidos.length; step2++) {
                        var cuota = r[step].partidos[step2].cuota
                        total = total*cuota;
                        var enfrentamiento =r[step].partidos[step2].enfrentamiento
                        var winner_bet =r[step].partidos[step2].team_bet
                        var won = true
                        if(winner_bet!=r[step].partidos[step2].winner){
                            ganada = false;
                            won = false
                        }
                        var status_match = r[step].partidos[step2].status
                        if(status_match=='FINISHED'&won==true)
                            status_match="WON"
                        if(status_match=='FINISHED'&won==false)
                            status_match="LOST"
                        addBet3 += "<h5>"+enfrentamiento+"</h5><h6>Match-winner: "+winner_bet+" Cuota: "+cuota+"€</h6>\n" +
                            "                <h6> Status: "+status_match+"</h6>"
                    }
                    if(status2=="FINISHED"&ganada==false)
                        status2="LOST"
                    if(status2=="FINISHED"&ganada==true)
                        status2="WON"
                    var addBet2 ="<h4>Estado de Apuesta: "+status2+"</h4>\n" +
                        "            <h4>Partidos apostados: </h4>\n" +
                        "            <div class=\"scroll-matches\">"
                    var addBet1 ="<div class=\"verApuestasUser "+status2+"\">\n" +
                        "            <h2>Id de apuesta: "+id_bet+"</h2>\n"
                    addBet = addBet1+addBet2+addBet3;
                    addBet += "</div><H5>Total: "+trunc(total,2)+"€</H5>\n" +
                        "        </div>"
                    document.getElementById('añadirBet').innerHTML+=addBet;
                }

            })
            //Errores de RED y respuestas KO
            .catch(e => console.log(e))
    }

    function trunc (x, posiciones = 0) {
        var s = x.toString()
        var l = s.length
        var decimalLength = s.indexOf('.') + 1

        if (l - decimalLength <= posiciones){
            return x
        }
        // Parte decimal del número
        var isNeg  = x < 0
        var decimal =  x % 1
        var entera  = isNeg ? Math.ceil(x) : Math.floor(x)
        // Parte decimal como número entero
        // Ejemplo: parte decimal = 0.77
        // decimalFormated = 0.77 * (10^posiciones)
        // si posiciones es 2 ==> 0.77 * 100
        // si posiciones es 3 ==> 0.77 * 1000
        var decimalFormated = Math.floor(
            Math.abs(decimal) * Math.pow(10, posiciones)
        )
        // Sustraemos del número original la parte decimal
        // y le sumamos la parte decimal que hemos formateado
        var finalNum = entera +
            ((decimalFormated / Math.pow(10, posiciones))*(isNeg ? -1 : 1))

        return finalNum
    }

}