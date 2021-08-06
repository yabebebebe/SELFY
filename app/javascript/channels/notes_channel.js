import consumer from "./consumer"

consumer.subscriptions.create("NotesChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.content.comment}</p>`;
    const notes = document.getElementById('notes');
    const newNote = document.getElementById('note_comment');
    const submit = document.getElementById('note-submit');
    notes.insertAdjacentHTML('afterend', html);
    newNote.value='';
    submit.disabled = false;
  }
});
