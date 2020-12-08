import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>＠${data.user.nickname}</p>
                  <p>${data.content.content}</p>
                  ${data.content.created_at}`;

    const messages = document.getElementById('comment-create');
    const newMessage = document.getElementById('comment_content');
    messages.insertAdjacentHTML('beforebegin', html);
    newMessage.value='';
  }
});
