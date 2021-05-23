var defaultValueImage = "<svg class='img-l' xmlns='http://www.w3.org/2000/svg' x='0px' y='0px'width='24' height='24'viewBox='0 0 172 172'"+
    "style='' fill:#000000;''> <g transform=''> <g fill='none' fill-rule='nonzero' stroke='none' stroke-width='1' stroke-linecap='butt' stroke-linejoin='miter' stroke-miterlimit='10' stroke-dasharray='' stroke-dashoffset='0' font-family='none' font-weight='none' font-size='none' text-anchor='none' style='mix-blend-mode: normal'><path d='M0,172v-172h172v172z' fill='none'>"+
    " </path><path d='M86,172c-47.49649,0 -86,-38.50351 -86,-86v0c0,-47.49649 38.50351,-86 86,-86v0c47.49649,0 86,38.50351 86,86v0c0,47.49649 -38.50351,86 -86,86z' fill='#d70f0f'></path><g fill='#000000'> <path d='M86,34.4c-12.66573,0 -22.93333,10.2676 -22.93333,22.93333c0,12.66573 10.2676,22.93333 22.93333,22.93333c12.66573,0 22.93333,-10.2676 22.93333,-22.93333c0,-12.66573 -10.2676,-22.93333 -22.93333,-22.93333zM86,97.46667c-17.22293,0 -51.6,8.64587 -51.6,25.8v14.33333h103.2v-14.33333c0,-17.15413 -34.37707,-25.8 -51.6,-25.8z'>+"

"</path></g></g></g></svg>"

function cargarDatos(){
    if (localStorage.getItem('nombre')==null) {
    } else {
        var saludo = 'Hi, ' + localStorage.getItem('nombre') + '!';
        var imagen;
        if(localStorage.getItem('logo')=="default"){
            imagen = defaultValueImage
        }else{
            imagen = '<img src= "' + localStorage.getItem('logo') + '" width="24" height="24">';
        }
        document.getElementById('text-user').innerHTML = saludo;
        document.getElementById('img-user').innerHTML = imagen;
        document.getElementById('borrar').innerHTML = '<div class="dropdown-menu">\n' +
            '                                       <button class="dropdown-item" onclick="logout()">Log out</button>\n' +
            '                                   </div>';
    }
}

function logout() {
    var imagen = defaultValueImage;
    document.getElementById('text-user').innerHTML = 'Log in';
    document.getElementById('img-user').innerHTML = imagen;
    document.getElementById('borrar').innerHTML = '';
    document.getElementById('saldo-user').innerHTML=", Saldo: 0€"
    localStorage.clear();
    location.reload()
}
