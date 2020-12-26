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
    
    if (document.getElementById('row').dataset.id = data.current_user.id){
      var de = `<a id="delete-btn", data-method="delete" href="/posts/${data.post.id}/comments/${data.id}"><button id="${data.id}">削除</button></a>` ;
    }else{
      var de = "" ;
    };
    debugger
    const html = `<div id="data-test-${data.id}">
                  <p><a href="/users/${data.user.id}">@${data.user.nickname}</a></p>
                  <span style="font-weight:bold;">${data.content.content}</span>
                  &nbsp;${data.date}
                  ${de}
                  </div>`;

    const messages = document.getElementById('row');
    const newMessage = document.getElementById('comment_content');
    messages.insertAdjacentHTML('beforeend', html);
    newMessage.value='';
  }
});
})