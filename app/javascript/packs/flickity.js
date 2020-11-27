
const Flickity = require("flickity")


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();

  var elem = document.querySelector('.gallery');
  if (elem) {
    var flkty = new Flickity( elem, {
    // options
    wrapAround: true
  });
  }

});
