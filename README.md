# SportBets
En este repositorio se puede encontrar el código y ademas un .jar de la aplicación creada. 

Consideraciones relevantes: 
* Navegador recomendado -> Chrome
* Puerto utilizado -> 8080
* Url -> http://localhost:8080/
* Al encontrarse la BD en una plataforma online, ciertas operaciones pueden tardar unos pocos segundos
* Para acceder a la pantalla de login -> pulsar sobre el icono
* Pagina de administrador de eventos (para poder generar nuevos eventos).
  + URL: http://localhost:8080/AdminMatches.html
  + Modalidad por defecto
    * Duración de los eventos 0s. Cuando empieza el evento, finaliza. (Para que esté disponible el resultado del evento, y las apuestas sean más rápidas).
    * Se generan 380 partidos, 10 partidos por día, por tanto eventos para 38 días.
    * Esperar unos 3 segundos antes de restear los partidos de diferentes ligas. 
  + Modalidad personalizado
    * Se puede seleccionar: hora, minuto y duración de los partidos.
    * Una vez seleccionados los paramétros, se crean 380 partidos, 10 por día (a la hora seleccionada), por tanto eventos para 38 días.

Se ha creado un modelo de casa de apuestas, cuyo alcance se describe a continuación:

  - Pagina de home, store policies, support, about, contact, faq, bets, see bets, payment method, login
  
  - Inicio Sesión & Registro - Posibilidad de registrarse e iniciar sesión con Google.
  
  - Servicio de correos electronicos
    + Correo de bienvenida
    + Correo para restablecer una nueva contraseña
    + Correo de Support (cuando selecciona que esta teniendo una incidencia)
  
  - Servicio de eventos deportivos, se pueden encontrar eventos futobolísticos de las siguientes ligas:
    + La Liga - España
    + Ligue 1 - Francia
    + Premier - Inglaterra 
    + Serie A - Italia
    + Champions
    
  - Servicio de gestión de apuestas apuestas
    + Realizar Apuestas
        * Simples
        * Combinadas - diferentes ligas
        * Diferentes cantidades para una apuesta, por defecto será de 1E.
    + Visualización del estado apuestas: LOST, WON, SCHEDULED
   
  - Servicio de gestión de saldo de usuarios
    + Para poder realizar apuestas se debe tener saldo, y haber añadido un método de pago.
    + Al introducir la cantidad en Payment Method, viene por defecto las siguientes cantidades 1, 5, 10 y 20 Euros.
      * Puede introducirse otra cantidad, mientras sea un número entero.
    + Al realizar una apuesta, por defecto se descontará 1E, a no ser que se introduzca otra cantidad, en cuyo caso se decontará dicha cantidad.
    + Al finalizar una apuesta, en caso de haber sido ganada, se añadirá al saldo del usuario, los beneficios correspondientes.
   
   - Consideraciones: 
  	* Los eventos tienen unos timers, al finalizar dichos timers: 
	    + Se cargan los proximos eventos disponibles al cabo de unos segundos.
	    + Las apuestas que se estuvieran realizando serán eliminadas, puesto que han caducado eventos.

   - En caso de cualquier fallo con la aplicación, se agradecería que se notificara.
   
   
