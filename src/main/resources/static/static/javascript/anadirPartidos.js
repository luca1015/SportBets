 var direccion_partidos = 'http://localhost:8080/api/matches/';

    function obtener_partidos() {
        cargarBarraNavegacion()
        obtener_partidosLigas("Es")
    }
    function obtener_partidosLigas(liga){
        var pais;
        switch (liga) {
            case "Es":
                pais = "SP"
                var imagen = "LaLiga.png"
                break;
            case "In":
                pais = "IN"
                var imagen = "Premier.png"
                break;
            case "It":
                pais = "IT"
                var imagen = "SerieA.png"
                break;
            case "Fr":
                pais = "FR"
                var imagen = "Ligue1.png"
                break;
            case "Cl":
                pais = "CL"
                var imagen = "Champions.png"
                break;
            default:
                break;
        }
        var url = direccion_partidos+pais
        fetch(url,
            {
                method: 'GET',
                headers: {
                    Accept : 'application/json',
                }
            })
            //Suscribimos a la promesa Response
            .then(res => {
                if(res.ok){
                    //Si la respuesta se resolvió bien, procedemos a resolver la promesa Body
                    return res.json()
                }else{
                    throw res;
                }
            })
            //Suscribimos a la promesa Body
            .then(r => {
                //r.matches.length
                document.getElementById('matches-info').innerHTML="";
                for (let step = 0; step < r.length; step++){
                    var id = r[step].id
                    var enfrentamiento = r[step].enfrentamiento
                    var fecha = r[step].fechaInicio;
                    var date = new Date(fecha);
                    var anio = date.getFullYear();
                    var dia = date.getDate();
                    var mes = date.getUTCMonth()+1;
                    if(dia<10)
                        dia = "0"+dia.toString()
                    if(mes<10)
                        mes = "0"+mes.toString()
                    var hora = date.getHours();
                    var minuto = date.getMinutes();
                    if(hora<10 && hora.length!=2)
                        hora = "0"+hora.toString()
                    if(minuto<10 && minuto.length!=2)
                        minuto = "0"+minuto.toString()
                    var fecha = dia+"-"+mes+"-"+anio+" - "+hora+":"+minuto;
                    var cuotaLocal = r[step].cuota1;
                    var cuotaEmpate = r[step].cuotaX;
                    var cuotaVisitante = r[step].cuota2;
                    anadirPartido(fecha,enfrentamiento,id,hora,imagen,cuotaLocal,cuotaEmpate,cuotaVisitante)
                }
                pintarCajas();

            })
            //Errores de RED y respuestas KO
            .catch(e => console.log(e))
    }

    function anadirPartido(fecha,enfrentamiento,id,hora,imagen,cuotaLocal,cuotaEmpate,cuotaVisitante){


        var partido = document.getElementById('matches-info');
        partido.innerHTML += "<div class=\"match-box\">\n" +
            "                <img src=\"static/images/"+imagen+"\" class=\"icon-league child\">\n" +
            "                <div class=\"child bet-info\">\n" +
            "                    <h3 class=\"title-match\" id='"+id+"'>"+enfrentamiento+"</h3>\n" +
            "                    <div class=\"father\">\n" +
            "                        <p class=\"child c-fecha\">"+fecha+"</p>\n" +
            "                        <p class=\"child c-t timer\">\n" +
            "                            <span class=\"time-left\">Time left to bet :</span>\n" +
            "                            <span id='days-"+id+"'></span> d\n" +
            "                            <span id='hours-"+id+"'></span> h\n" +
            "                            <span id='minutes-"+id+"'></span> min\n" +
            "                            <span id='seconds-"+id+"'></span> s\n" +
            "                        </p>\n" +
            "                    </div>\n" +
            "                    <div class=\"father3\">\n" +
            "                    <div id='lb-"+id+"' class=\"individual-match child3\" onclick=\"crearTicket('1','"+cuotaLocal+"','"+hora+"','"+enfrentamiento+"','lb-"+id+"','"+id+"')\">\n" +
            "                            <h6>1</h6>\n" +
            "                            <p>"+cuotaLocal+"</p>\n" +
            "                        </div>\n" +
            "                        <div id='db-"+id+"'class=\"individual-match child3\" onclick=\"crearTicket('X','"+cuotaEmpate+"','"+hora+"','"+enfrentamiento+"','db-"+id+"','"+id+"')\">\n" +
            "                            <h6>X</h6>\n" +
            "                            <p>"+cuotaEmpate+"</p>\n" +
            "                        </div>\n" +
            "                        <div id='vb-"+id+"' class=\"individual-match child3\" onclick=\"crearTicket('2','"+cuotaVisitante+"','"+hora+"','"+enfrentamiento+"','vb-"+id+"','"+id+"')\">\n" +
            "                            <h6>2</h6>\n" +
            "                            <p>"+cuotaVisitante+"</p>\n" +
            "                        </div>"+
            "                    </div>\n" +
            "                </div>\n" +
            "            </div>\n" +
            "            <hr class=\"match-line\">"

    }
