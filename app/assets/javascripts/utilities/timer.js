document.addEventListener('turbolinks:load', function() {
    var control = document.querySelector('.timer')
    if(control) { Start(control) }
})

function Start(control) {
    var testTimer = control.dataset.testTimer
    var testPassageId = control.dataset.testPassageId

    var countDownDate = new Date(Date.now() + testTimer * 1000).getTime();
    var x = setInterval(function() {

        var now = new Date().getTime();

        var distance = countDownDate - now;

        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        document.querySelector(".timer").innerHTML = "| Время: " + minutes + "м " + seconds + "с ";

        if (distance < 0) {
            window.location = '/test_passages/' + testPassageId + '/result'
            alert('Time is over!')
        }
    }, 1000);

}
