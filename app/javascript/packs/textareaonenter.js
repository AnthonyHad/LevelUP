document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();

  function pressed(e) {
            // Has the enter key been pressed?
            if ( (window.event ? event.keyCode : e.which) == 13) {
                // If it has been so, manually submit the <form>
                document.forms[0].submit();
            }
        }

});
