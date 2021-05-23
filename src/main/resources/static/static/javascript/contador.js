document.addEventListener('DOMContentLoaded', () => {

    // Milliseconds for the calculations
    const MILLISECONDS_OF_A_SECOND = 1000;
    const MILLISECONDS_OF_A_MINUTE = MILLISECONDS_OF_A_SECOND * 60;
    const MILLISECONDS_OF_A_HOUR = MILLISECONDS_OF_A_MINUTE * 60;
    const MILLISECONDS_OF_A_DAY = MILLISECONDS_OF_A_HOUR * 24

    function getIdPartidosAndTime(){
        var partidos = document.querySelectorAll('.match-box')
        let t = partidos.length;
        var partido_individual = new Map();
        for (let step = 0; step < t; step++) {
            let id = partidos[step].childNodes[3].childNodes[1].id;
            let time = partidos[step].childNodes[3].childNodes[3].childNodes[1].innerText;
            time = transformarFecha(time);
            partido_individual.set(id,time)
        }
        return partido_individual;
    }

    function transformarFecha(time_page){
        var time;
        var hours = time_page.substr(13,2)+":"
        var minutes = time_page.substr(16,2)
        var day = time_page.substr(0,2)+"T"
        var month = time_page.substr(3,2)+"-"
        var year = time_page.substr(6,4)+"-"
        time = year+month+day+hours+minutes;
        return time;
    }


    function updateCountdown() {

        var timeId = getIdPartidosAndTime();

        for (var [id, date] of timeId) {
            let daySelector = "span#days-"+id;
            let hourSelector = "span#hours-"+id;
            let minuteSelector = "span#minutes-"+id;
            let secondSelector = "span#seconds-"+id;

            const SPAN_DAYS = document.querySelector(daySelector);
            const SPAN_HOURS = document.querySelector(hourSelector);
            const SPAN_MINUTES = document.querySelector(minuteSelector);
            const SPAN_SECONDS = document.querySelector(secondSelector);

            const DATE_TARGET = new Date(date);
            const NOW = new Date()
            const DURATION = DATE_TARGET - NOW;
            const REMAINING_DAYS = Math.floor(DURATION / MILLISECONDS_OF_A_DAY);
            const REMAINING_HOURS = Math.floor((DURATION % MILLISECONDS_OF_A_DAY) / MILLISECONDS_OF_A_HOUR);
            const REMAINING_MINUTES = Math.floor((DURATION % MILLISECONDS_OF_A_HOUR) / MILLISECONDS_OF_A_MINUTE);
            const REMAINING_SECONDS = Math.floor((DURATION % MILLISECONDS_OF_A_MINUTE) / MILLISECONDS_OF_A_SECOND);

            // Render
            if(REMAINING_SECONDS<0 || REMAINING_MINUTES<0 || REMAINING_HOURS<0|| REMAINING_DAYS<0){
                SPAN_DAYS.textContent = '-';
                SPAN_HOURS.textContent = '-';
                SPAN_MINUTES.textContent = '-';
                SPAN_SECONDS.textContent = '-';
                global = 1;
            }else{
                SPAN_DAYS.textContent = REMAINING_DAYS;
                SPAN_HOURS.textContent = REMAINING_HOURS;
                SPAN_MINUTES.textContent = REMAINING_MINUTES;
                SPAN_SECONDS.textContent = REMAINING_SECONDS;
            }

        }

    }
    var global = 0;

    setInterval(restabler, 7*MILLISECONDS_OF_A_SECOND);
    function restabler() {
        if(global==1){
            alert("HAN CADUCADO ALGUNOS EVENTOS");
            window.location = "Bets.html";
        }
    }

    updateCountdown();

    setInterval(updateCountdown, MILLISECONDS_OF_A_SECOND);
});
