    var direccion_jornadas = '/api/partidosExterno/';
    var direccion_partidos = '/api/matches/';
    var direccion_resetear = '/api/ligues/';
    var direccion_eliminarApuestas = '/api/bets';

    function guardar_partidosLiga(liga){
        eliminarApuestasAnteriores()
        var direccion;
        direccion=direccion_jornadas+liga;
        resetearLiga(liga);
        fetch(direccion,
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
                console.log(r);
                var d = new Date();
                var current_day = d.getDate();
                var current_month = d.getMonth();
                var diferencia = 31-current_day;
                for (let step = 0; step < r.matches.length; step++){
                    var equipo1 = r.matches[step].homeTeam.name;
                    var equipo2 = r.matches[step].awayTeam.name;
                    var id = r.matches[step].id
                    var cuota1 = getRandom(1,3)
                    var cuotaX = getRandom(2,4)
                    var cuota2 = getRandom(3,4)
                    var goles1 = getRandomEntero(1,4)
                    var goles2 = getRandomEntero(1,3)
                    var resultado = goles1+'-'+goles2;
                    var winner = "1";
                    var timeIni = getRandomEntero(16,22);
                    var timeFin = timeIni+2;
                    var month = current_month;
                    var day = current_day+Math.floor(step/10);
                    var diferencia_step = diferencia*10-1;
                    if(step>diferencia_step){
                        day = Math.floor(step/10)-diferencia+1;
                        month = current_month+1;
                    }
                    var dateIni = new Date(2021,month,day,timeIni,0,0);
                    var dateFin = new Date(2021,month,day,timeFin,0,0);
                    if(goles2>goles1){
                        winner = "2";
                    }else if(goles2==goles1){
                        winner = 'X';
                    }
                    guardarPartido(id,equipo1,equipo2,'SCHEDULED',cuota1,cuotaX,cuota2,resultado,winner,dateIni,dateFin,liga);
                }

            })
            //Errores de RED y respuestas KO
            .catch(e => console.log(e))
    }

    function guardar_partidosLigaExpecial(liga){
        eliminarApuestasAnteriores()
        var direccion;
        var hora;
        var duracion;
        var minutos;
        switch (liga) {
            case "SP":
                direccion=direccion_jornadasEs;
                hora = document.getElementById('FH-SP').value;
                minutos = document.getElementById('MI-SP').value;
                duracion = document.getElementById('DE-SP').value;
                break;
            case "IN":
                direccion=direccion_jornadasIn;
                hora = document.getElementById('FH-IN').value;
                minutos = document.getElementById('MI-IN').value;
                duracion = document.getElementById('DE-IN').value;
                break;
            case "IT":
                direccion=direccion_jornadasIt;
                hora = document.getElementById('FH-IT').value;
                minutos = document.getElementById('MI-IT').value;
                duracion = document.getElementById('DE-IT').value;
                break;
            case "FR":
                direccion=direccion_jornadasL1;
                hora = document.getElementById('FH-FR').value;
                minutos = document.getElementById('MI-FR').value;
                duracion = document.getElementById('DE-FR').value;
                break;
            case "CL":
                direccion=direccion_jornadasCl;
                hora = document.getElementById('FH-CL').value;
                minutos = document.getElementById('MI-CL').value;
                duracion = document.getElementById('DE-CL').value;
                break;
            default:
                break;
        }
        resetearLiga(liga);
        var url = new URL(direccion)
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
                console.log(r);
                //r.matches.length
                var d = new Date();
                var current_day = d.getDate();
                var current_month = d.getMonth();
                var diferencia = 31-current_day;
                for (let step = 0; step < r.matches.length; step++){
                    var equipo1 = r.matches[step].homeTeam.name;
                    var equipo2 = r.matches[step].awayTeam.name;
                    var id = r.matches[step].id
                    var cuota1 = getRandom(1,3)
                    var cuotaX = getRandom(2,4)
                    var cuota2 = getRandom(3,4)
                    var goles1 = getRandomEntero(1,4)
                    var goles2 = getRandomEntero(1,3)
                    var resultado = goles1+'-'+goles2;
                    var winner = "1";
                    var horas_duracion = Math.floor(duracion/60);
                    var minutos_duracion = duracion-horas_duracion*60;
                    var horasfin = parseInt(hora)+parseInt(horas_duracion);
                    var minutosfin = parseInt(minutos)+parseInt(minutos_duracion);
                    if(minutosfin>59){
                        minutosfin = minutosfin-60;
                        horasfin = horasfin+1;
                    }
                    var month = current_month;
                    var day = current_day+Math.floor(step/10);
                    var diferencia_step = diferencia*10-1;
                    if(step>diferencia_step){
                        day = Math.floor(step/10)-diferencia+1;
                        month = current_month+1;
                    }
                    var dateIni = new Date(2021,month,day,hora,minutos,0);
                    var dateFin = new Date(2021,month,day,horasfin,minutosfin,0);
                    if(goles2>goles1){
                        winner = "2";
                    }else if(goles2==goles1){
                        winner = 'X';
                    }
                    guardarPartido(id,equipo1,equipo2,'SCHEDULED',cuota1,cuotaX,cuota2,resultado,winner,dateIni,dateFin,liga);
                }

            })
            //Errores de RED y respuestas KO
            .catch(e => console.log(e))
    }

    function guardarPartido(id,equipo1,equipo2,status,cuota1,cuotaX,cuota2,resultado,winner,dateIni,dateFin,pais) {
        var data = {"id": id,
            "local": equipo1,
            "visitante": equipo2,
            "clocal": cuota1,
            "empate": cuotaX,
            "cvisitante": cuota2,
            "dateini": dateIni,
            "datefini": dateFin,
            "result": resultado,
            "status": status,
            "winner": winner,
            "pais": pais

        };
        fetch(direccion_partidos,
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
            })
            //Errores de RED y respuestas KO
            .catch(e => console.log(e))
    }

    function resetearLiga(liga) {
        const address = direccion_resetear+liga
        fetch(address,
            {
                method: 'DELETE',
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
            })
            //Errores de RED y respuestas KO
            .catch(e => console.log(e))
    }

    function eliminarApuestasAnteriores(){
        fetch(direccion_eliminarApuestas,
            {
                method: 'DELETE',
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
            })
            //Errores de RED y respuestas KO
            .catch(e => console.log(e))
    }

    function getRandom(minimo, maximo) {
        var decimales = 2;
        var precision = Math.pow(10, decimales);
        minimo = minimo*precision;
        maximo = maximo*precision;
        return Math.floor(Math.random()*(maximo-minimo+1) + minimo) / precision;
    }
    function getRandomEntero(X, Y) {
        return Math.floor(Math.random()*(Y-X))+X;
    }
