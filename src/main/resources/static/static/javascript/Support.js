function enviarCorreoSupport(){
    //var nombre = document.getElementById('validation');
    //var apellidos = document.getElementById('validation2');
    //var phone = document.getElementById('validation3');
    var email= document.getElementById('validation3').value;
    var email2= localStorage.getItem('email');
    var issue= document.getElementById('seleccion').value;
    console.log(issue)
    if(issue=="")
        alert("Debe seleccionar un problema")
    else {
        if(email!=email2)
            alert("La cuenta de correo electronico introducida no coincide con la de la cuenta")
        else
            if(email!=null || email!="")
                supportEmail(email, issue)
            else
                console.log("El email no puede ser nulo")
        window.location = 'Support.html'
    }

}