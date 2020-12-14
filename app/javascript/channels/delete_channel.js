import consumer from "./consumer"
window.addEventListener('load', function(){
consumer.subscriptions.create("DeleteChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },
 
  received(data) {
    const container = document.getElementById(`comment-${data.id}`);
    if (container) {
    container.parentNode.removeChild(container);
    }
    },
});
})
