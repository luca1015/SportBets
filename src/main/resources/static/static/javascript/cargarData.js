var direccion_obtenerSaldo = '/api/user/';
var direccion_comprobarExiste = '/api/user/bank/login';
function cargarBarraNavegacion(){
    document.getElementById('barra-navegacion').innerHTML= "<div id=\"bar-margin\">\n" +
        "               <div class=\"bar-container\">\n" +
        "                   <p style = \"font-family:optima,arial,helvética; color: white;\">\n" +
        "                       <FONT SIZE=7> SportBets</FONT>\n" +
        "                   </p>\n" +
        "               </div>\n" +
        "               <hr class=\"linea-bar\">\n" +
        "               <nav class=\"navbar\">\n" +
        "                   <ul id='verApuestas' class=\"nav\">\n" +
        "                       <li>\n" +
        "                           <a class=\"nav-link\" href=\"../../index.html\">\n" +
        "                               Home </a>\n" +
        "                       </li>\n" +
        "                       <li>\n" +
        "                           <a class=\"nav-link\" href=\"../../Bets.html\">\n" +
        "                               Bets </a>\n" +
        "                       </li>\n" +
        "                       <li>\n" +
        "                           <a class=\"nav-link\" href=\"../../StorePolicies.html\">\n" +
        "                               Store Policies </a>\n" +
        "                       </li>\n" +
        "                       <li>\n" +
        "                           <a class=\"nav-link\" href=\"../../Support.html\">\n" +
        "                               Support </a>\n" +
        "                       </li>\n" +
        "                       <li>\n" +
        "                           <a class=\"nav-link\" href=\"../../About.html\">\n" +
        "                               About </a>\n" +
        "                       </li>\n" +
        "                       <li>\n" +
        "                           <a class=\"nav-link\" href=\"../../Contact.html\">\n" +
        "                               Contact </a>\n" +
        "                       </li>\n" +
        "                       <li>\n" +
        "                           <a class=\"nav-link\" href=\"../../FAQ.html\">\n" +
        "                               FAQ </a>\n" +
        "                       </li>\n" +
        "                       <li>\n" +
        "                           <a class=\"nav-link\" href=\"../../CardData.html\">\n" +
        "                               Payment Method</a>\n" +
        "                       </li>\n" +
        "\n" +
        "                   </ul>\n" +
        "                   <ul class=\"nav\">\n" +
        "                       <li>\n" +
        "                           <a class=\"nav-link\">\n" +
        "                               <div class=\"btn-group\ onclick=\"loginweb()\">\n" +
        "                                   <a id=\"text-user\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Log in </a>\n" +
        "                                   <p id=\"saldo-user\" class='parr' style='color: white' >|Saldo: 0€|</p>\n" +
        "                                   <div id=\"borrar\">\n" +
        "                                   </div>\n" +
        "                               </div>\n" +
        "                           </a>\n" +
        "                       </li>\n" +
        "                       <li>\n" +
        "                           <a class=\"nav-link\" href=\"../../login.html\">\n" +
        "                               <div id=\"img-user\" class=\"div-inline log-user\">\n" +
        "                                    <svg class=\"img-l\" xmlns=\"http://www.w3.org/2000/svg\" x=\"0px\" y=\"0px\"\n" +
        "                                    width=\"24\" height=\"24\"\n" +
        "                                    viewBox=\"0 0 172 172\"\n" +
        "                                    style=\" fill:#000000;\">\n" +
        "                                   <g transform=\"\">\n" +
        "                                       <g fill=\"none\" fill-rule=\"nonzero\" stroke=\"none\" stroke-width=\"1\" stroke-linecap=\"butt\" stroke-linejoin=\"miter\" stroke-miterlimit=\"10\" stroke-dasharray=\"\" stroke-dashoffset=\"0\" font-family=\"none\" font-weight=\"none\" font-size=\"none\" text-anchor=\"none\" style=\"mix-blend-mode: normal\"><path d=\"M0,172v-172h172v172z\" fill=\"none\">\n" +
        "                                       </path><path d=\"M86,172c-47.49649,0 -86,-38.50351 -86,-86v0c0,-47.49649 38.50351,-86 86,-86v0c47.49649,0 86,38.50351 86,86v0c0,47.49649 -38.50351,86 -86,86z\" fill=\"#d70f0f\"></path><g fill=\"#000000\">\n" +
        "                                           <path d=\"M86,34.4c-12.66573,0 -22.93333,10.2676 -22.93333,22.93333c0,12.66573 10.2676,22.93333 22.93333,22.93333c12.66573,0 22.93333,-10.2676 22.93333,-22.93333c0,-12.66573 -10.2676,-22.93333 -22.93333,-22.93333zM86,97.46667c-17.22293,0 -51.6,8.64587 -51.6,25.8v14.33333h103.2v-14.33333c0,-17.15413 -34.37707,-25.8 -51.6,-25.8z\">\n" +
        "\n" +
        "                                           </path></g></g></g></svg>\n" +
        "                               </div>\n" +
        "                           </a>\n" +
        "                       </li>\n" +
        "                   </ul>\n" +
        "               </nav>\n" +
        "           </div>";
    document.getElementById('footer').innerHTML= "<div class=\"footer-icons\">\n" +
        "                <div class=\"img-icon\">\n" +
        "                    <img src=\"https://static.wixstatic.com/media/23fd2a2be53141ed810f4d3dcdcd01fa.png/v1/fill/w_30,h_30,al_c,q_85,usm_0.66_1.00_0.01/Facebook.webp\" alt=\"\" width=\"100%\" height=\"100%\"/>\n" +
        "                </div>\n" +
        "                <div class=\"img-icon\">\n" +
        "                    <img src=\"https://static.wixstatic.com/media/01ab6619093f45388d66736ec22e5885.png/v1/fill/w_30,h_30,al_c,q_85,usm_0.66_1.00_0.01/Twitter.webp\" alt=\"\" width=\"100%\" height=\"100%\"/>\n" +
        "                </div>\n" +
        "                <div class=\"img-icon\">\n" +
        "                    <img src=\"https://static.wixstatic.com/media/7528824071724d12a3e6c31eee0b40d4.png/v1/fill/w_30,h_30,al_c,q_85,usm_0.66_1.00_0.01/LinkedIn.webp\" alt=\"\" width=\"100%\" height=\"100%\"/>\n" +
        "                </div>\n" +
        "            </div>\n" +
        "            <p class=\"font_9\" style=\"text-align:center;line-height:1.875em;font-size:15px\"><span class=\"color_11\">©2021 by SportsBets</span></p>";
    opcionVerApuestas();
    cargarDatos();
    modificarSaldo();
}

function opcionVerApuestas() {
    var email = localStorage.getItem('email')
    if(email!=null){
        var elementos = document.getElementById('verApuestas');
        elementos.innerHTML += "<li>\n" +
            "                           <a class=\"nav-link\" href=\"../../VerApuestas.html\">\n" +
            "                               See Bets</a>\n" +
            "                       </li>\n"
    }
}

function modificarSaldo() {
    var email = localStorage.getItem('email')
    if(email!=null){
        tieneSaldo(email)
    }
}

function tieneSaldo(email){
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
                modificarSaldoUsuario(email)
            }else{

            }
        })
        //Errores de RED y respuestas KO
        .catch(e => console.log(e))
}

function modificarSaldoUsuario(email){
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
            if(r==null)
                r=0;
            r=round(r);   // 55.6
            document.getElementById('saldo-user').innerHTML="|Saldo: "+r+"€|"
        })
        //Errores de RED y respuestas KO
        .catch(e => console.log(e))
}
function round(num, decimales = 2) {
    var signo = (num >= 0 ? 1 : -1);
    num = num * signo;
    if (decimales === 0) //con 0 decimales
        return signo * Math.round(num);
    // round(x * 10 ^ decimales)
    num = num.toString().split('e');
    num = Math.round(+(num[0] + 'e' + (num[1] ? (+num[1] + decimales) : decimales)));
    // x * 10 ^ (-decimales)
    num = num.toString().split('e');
    return signo * (num[0] + 'e' + (num[1] ? (+num[1] - decimales) : -decimales));
}

