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

    const test = document.getElementById(`${data.id}`)
    const container = document.getElementById(`test-${data.id}`);
    console.log(container)
    container.remove();
    
    },
    
});
})
