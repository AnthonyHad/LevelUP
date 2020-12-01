import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'count' ];

  refresh(event) {
    const id = event.currentTarget.dataset.id;
    setTimeout( () => { 
      fetch(`/posts/${id}/update_counter`, { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        document.getElementById(`discussion-${id}`).innerText = data.likes.length;
      });
    }, 
    500)
  }
}