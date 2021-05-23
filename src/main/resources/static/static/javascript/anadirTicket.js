function crearTicket(ganador,cuota,hora,partido,id,id_global) {

    var apuestas = document.getElementById('apuestas');
    var ganadorString;
    var id_d;
    var ids = getIds()
    var partido_unico = ids.indexOf(id_global);
    if(ganador==1){
        ganadorString = "Gana equipo local";
        id_d="l"+id;
    }else if(ganador==2) {
        ganadorString = "Gana equipo visitante";
        id_d="v"+id;
    }else{
        ganadorString = "Empate";
        id_d="d"+id;
    }

    var existe = document.getElementById(id_d);
    var matchBet = ganador;

    if(existe==null && partido_unico<0){
        var valor = "<div id="+id_d+"><div class=\"apuesta-individual\">\n" +
            "                    <h4 class=\"child\">"+ganadorString+"</h4>\n" +
            "                    <h4 class=\"child bet-winner color-bet\">"+cuota+"</h4>\n" +
            "                    <button style=\"outline: none;\" class=\"close-button child2\" role=\"link\" onclick=\"eliminarTicket('"+id_d+"','"+cuota+"','"+id_global+"','"+id+"')\">\n" +
            "                        <img class = \"close-img\" src=\"static/images/Cruz-blanca.png\"/>\n" +
            "                    </button>\n" +
            "                </div>\n" +
            "                <h6>"+partido+" "+hora+"</h6>\n" +
            "                <hr class=\"bet-match-line\"></div>"
        apuestas.innerHTML += valor;
        setCuotas(cuota,true)
        setMatchesBet(matchBet)
        actualizarGanancia()
        var boton = document.getElementById(id);
        boton.style.backgroundColor = 'rgb(25,25,25)';
        setIdss(id_global)
        setIdssLabel(id)
    }else if(existe!=null){
        eliminarTicket(id_d,cuota,id_global,id,matchBet)
    }
}

var cuotas = new Array()

function getCuotas() {
    return cuotas;
}
function setCuotas(cuota,operacion){
    if(operacion){
        cuotas.push(cuota)
    }

}

var matches_bet = new Array()

function getMatchesBet() {
    return matches_bet;
}
function setMatchesBet(matches_bet2){
        matches_bet.push(matches_bet2)

}

function pintarCajas(){
    var ids = getIdsLabel();
    console.log(ids);
    for (var step=0; step<ids.length; step++){
        var id = ids[step];
        var boton = document.getElementById(id);
        if(boton!=null)
            boton.style.backgroundColor = 'rgb(25,25,25)';
    }
}

var id_matches_label = new Array();

var id_matches = new Array()

function getIdsLabel() {
    return id_matches_label;
}
function setIdssLabel(id){
    id_matches_label.push(id)

}

function getIds() {
    return id_matches;
}
function setIdss(id){
    id_matches.push(id)

}

function eliminarId ( arr, item ) {
    var i = arr.indexOf( item );

    if ( i !== -1 ) {
        arr.splice( i, 1 );
    }
}

function eliminarCuota ( arr, item ) {
    var i = arr.indexOf( item );

    if ( i !== -1 ) {
        arr.splice( i, 1 );
    }
}

function eliminarTicket(id,cuota,id_global,id_btn,matchBet) {
    console.log(cuota+matchBet)
    var boton = document.getElementById(id_btn);
    if(boton!=null)
        boton.style.backgroundColor = 'rgb(237,90,69)';
    var ids = getIds()
    var ids_label = getIdsLabel()
    var parent = document.getElementById('apuestas')
    var div = document.getElementById(id)
    var i = ids.indexOf( id_global)
    parent.removeChild(div);
    var cuotas = getCuotas()
    var matchesBet = getMatchesBet()
    cuotas.splice( i, 1 );
    matchesBet.splice(i,1)
    //eliminarCuota(getCuotas(),cuota)
    //eliminarCuota(getMatchesBet(),matchBet)
    actualizarGanancia()
    eliminarId(ids,id_global)
    eliminarId(ids_label,id_btn);
}

function actualizarGanancia(){
    var cuotas_array = getCuotas();
    var multiplicador = 1;
    for (var i=0; i<cuotas_array.length; i++) {
        multiplicador = multiplicador * cuotas_array[i];
    }
    var cantidad = document.getElementById('cantidad-apostada').value
    if(cantidad<0 || cantidad==""){
        cantidad=1;
    }
    cantidad = trunc(cantidad,2)
    multiplicador = multiplicador*cantidad;
    multiplicador = trunc(multiplicador,2)
    var gananciaId = document.getElementById('ganancias')
    gananciaId.innerHTML = "Ganancias: "+multiplicador+" €";
}

const cantidaApostada = document.getElementById('cantidad-apostada');

cantidaApostada.addEventListener('change', (event) => {
    actualizarGanancia()
});

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
