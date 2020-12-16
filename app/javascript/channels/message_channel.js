import consumer from "./consumer"
window.addEventListener('load', function(){

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<div id="test-${data.id}">
    <p><a href="/users/${data.user.id}">@${data.user.nickname}</a></p>
                  <span style="font-weight:bold;">${data.content.content}</span>
                  &nbsp;${data.date}
                  &nbsp;<a id="delete-btn", data-method="delete" href="/posts/${data.post.id}/comments/${data.id}"><button id="${data.id}">削除</button></a>
                  </div>`;

    const messages = document.getElementById('collapseExample');
    const newMessage = document.getElementById('comment_content');
    messages.insertAdjacentHTML('beforeend', html);
    newMessage.value='';
  }
});
})