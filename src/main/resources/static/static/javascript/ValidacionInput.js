document.getElementById("validation").addEventListener("keyup", myFunction);
document.getElementById("validation2").addEventListener("keyup", myFunction);
document.getElementById("validation3").addEventListener("keyup", myFunction);
document.getElementById("validation4").addEventListener("keyup", myFunction);

function myFunction() {
    var campo = document.getElementById("validation");
    var campo2 = document.getElementById("validation2");
    var campo3 = document.getElementById("validation3");
    var campo4 = document.getElementById("validation4");
    if (campo.value == '') {
        campo.style.borderBottomColor = "red";
    } else {
        campo.style.borderBottomColor = "green";
    }
    if (campo2.value == '') {
        campo2.style.borderBottomColor = "red";
    } else {
        campo2.style.borderBottomColor = "green";
    }
    if (campo3.value == '') {
        campo3.style.borderBottomColor = "red";
    } else {
        campo3.style.borderBottomColor = "green";
    }
    if (campo4.value == '') {
        campo4.style.borderBottomColor = "red";
    } else {
        campo4.style.borderBottomColor = "green";
    }
}