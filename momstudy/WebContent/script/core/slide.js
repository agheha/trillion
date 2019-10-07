      document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
            plugins: [ 'dayGrid' ]
            });	

            calendar.render();
        });

        $(document).ready(function() {
            $('.slide_wrap').slick({
                slidesToShow: 4,
                slidesToScroll: 1,
                autoplaySpeed: 3000,
                autoplay: true,
            });
        });