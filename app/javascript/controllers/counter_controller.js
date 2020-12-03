import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'count' ];

  refresh_discussion(event) {
    const id = event.currentTarget.dataset.id;
    let liked = event.currentTarget.classList.add("liked");
    setTimeout( () => {
      fetch(`/posts/${id}/update_counter`, { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        document.getElementById(`discussion-${id}`).innerText = data.likes.length;
      });
    },
    500)
  }

  refresh_devlogs(event) {
    const id = event.currentTarget.dataset.id;
    let liked = event.currentTarget.classList.add("liked");
    setTimeout( () => {
      fetch(`/posts/${id}/update_counter`, { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        document.getElementById(`devlog-${id}`).innerText = data.likes.length;
      });
    },
    500)
  }

  refresh_post(event) {
    const id = event.currentTarget.dataset.id;
    let liked = event.currentTarget.classList.add("liked");
    setTimeout( () => {
      fetch(`/posts/${id}/update_counter`, { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        document.getElementById(`post-${id}`).innerText = data.likes.length;
      });
    },
    500)
  }

}
