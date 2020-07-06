document.addEventListener('turbolinks:load', function() {
    var control = document.querySelector('.progress-bar')
    if(control) { Progress(control) }
})

function Progress(control) {
    var currentQuestion = control.dataset.questionNumber
    var QuestionsCount = control.dataset.questionsNumber
    var progress = Math.floor(((currentQuestion - 1)/QuestionsCount)*100)
    control.style.width = progress + '%'
}
