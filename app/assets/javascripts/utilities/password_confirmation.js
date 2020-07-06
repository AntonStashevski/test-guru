document.addEventListener('turbolinks:load', function() {
    var control = document.querySelector('.confirmation')
    if(control) {control.addEventListener('input', confirmPassword)}
})

function confirmPassword(){
    var password_field = document.querySelector('.password').value
    var confirmation_field = this.value
    var confirm = this.parentNode.querySelector('.octicon-check')
    var not_confirm = this.parentNode.querySelector('.octicon-x')

    if(confirmation_field == ''){
        confirm.classList.add('hide')
        not_confirm.classList.add('hide')
        return
    }

    if(password_field == confirmation_field){
        confirm.classList.remove('hide')
        not_confirm.classList.add('hide')
    } else {
        confirm.classList.add('hide')
        not_confirm.classList.remove('hide')
    }
}
