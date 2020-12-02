// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "@mdi/font/css/materialdesignicons.css";
import $ from 'jquery';
import "controllers"

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  const forms =  document.querySelectorAll('#new_reply');
  forms.forEach((form) => {
    const textarea = form.querySelector('#reply_content');
    textarea.addEventListener('keydown', (event) => {
      console.log(event);
      if (event.keyCode === 13) {
        event.preventDefault();
        form.submit();

      }
    })



  })

  const replies = document.querySelectorAll('.see-comments');
  const container = document.querySelectorAll('.replies-container');
  const counter = document.getElementById('comment-number');
  const see_less = document.querySelectorAll('.see-less');

  // console.log(container);
  // console.log(replies);
  replies.forEach((reply) => {
    reply.addEventListener('click', (event) => {
      const count = event.currentTarget.parentNode.children[4].children.length;
      event.currentTarget.parentNode.children[4].classList.toggle('hide');
      event.currentTarget.classList.toggle('hide');
      event.currentTarget.parentNode.children[7].classList.toggle('hide');
    })
  });

  see_less.forEach((show_less) => {
    show_less.addEventListener('click', (event) => {
      event.currentTarget.parentNode.children[4].classList.toggle('hide');
      event.currentTarget.classList.toggle('hide');
      event.currentTarget.parentNode.children[5].classList.toggle('hide');
    })
  });



  const followingBtns = document.querySelectorAll("#following-button")

  followingBtns.forEach((btn) => {
    btn.addEventListener("click", (event) => {
      event.currentTarget.innerText = "+ Follow game!"
      event.currentTarget.classList.replace("following-button", "follow-button")
    })
  });

  const followBtns = document.querySelectorAll("#follow-button")

  followBtns.forEach((btn) => {
    btn.addEventListener("click", (event) => {
      event.currentTarget.innerText = "✓ Following"
      event.currentTarget.classList.replace("follow-button", "following-button");
    })
  });
});

const modal = document.getElementById("welcome-modal")
if (modal) {
  document.getElementById("body-tag").classList.add("blur")
}


