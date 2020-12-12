import consumer from "./consumer"


consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p><a href="/#/">@${data.user.nickname}</a></p>
                  <span style="font-weight:bold;">${data.content.content}</span>
                  &nbsp;${data.date}
                  &nbsp;<button id="<%=comment.post.id%>" class="delete-btn">削除</button>`;

    const messages = document.getElementById('comment-box');
    const newMessage = document.getElementById('comment_content');
    messages.insertAdjacentHTML('beforebegin', html);
    newMessage.value='';
  }
});
