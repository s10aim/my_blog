require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("bootstrap/dist/js/bootstrap");

require("@fortawesome/fontawesome-free/js/all")
require("trix");
require("@rails/actiontext");


document.addEventListener('turbolinks:load', () => {
  const formTitle = document.getElementById('post_title')
  const formContent = document.getElementById('post_content')
  const btn = document.getElementById("btn")

  if (formTitle) {
    [formTitle, formContent].forEach((form) => {
      form.addEventListener('keyup', () => {
        btn.disabled = !(formTitle.value && formContent.value)
      })
    })

    // 1.<formTitle>
    // formTitle.addEventListener('keyup', () => {
    // if (formTitle.value && formContent.value) {
    //   btn.disabled = false
    // } else {
    //   btn.disabled = true
    // }
    // 上記のif文を簡潔に
    //   btn.disabled = !(formTitle.value && formContent.value)
    // })
    // 
    // 2.<formContent> 上に同じ
    // formContent.addEventListener('keyup', () => {
    //   btn.disabled = !(formTitle.value && formContent.value)
    // })
  }
})