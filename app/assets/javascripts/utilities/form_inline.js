document.addEventListener('turbolinks:load', function() {
    var controls = document.querySelectorAll('.form-inline-link')

    if (controls.length) {
        for (var i = 0; i < controls.length; i++) {
            controls[i].addEventListener('click', formInlineLinkHandler)
        }
    }

    var errors = document.querySelector('.resource-errors')

    if (errors) {
        var resourceId = errors.dataset.resourceId
        formInlineHandler(resourceId)
    }
})

function formInlineLinkHandler() {
    event.preventDefault()
    var test_id = this.dataset.testId
    console.log(test_id)
    formInlineHandler(test_id)
}

function formInlineHandler(test_id) {
    var link = document.querySelector('.form-inline-link[data-test-id="' + test_id +'"]')
    var testTitle = document.querySelector('.test-title[data-test-id="' + test_id +'"]')
    var formInline = document.querySelector('.form-inline[data-test-id="' + test_id +'"]')

    if ( formInline.classList.contains('hide')) {
        testTitle.classList.add('hide')
        formInline.classList.remove('hide')
        link.textContent = 'Cancel'
    } else {
        testTitle.classList.remove('hide')
        formInline.classList.add('hide')
        link.textContent = 'Edit'
    }
}
