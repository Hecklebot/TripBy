let output = document.getElementById('chatting-output');
let input = document.getElementById('chatting-input');
let sendBtn = document.getElementById('sendBtn');

function onOpen(socket) {
  console.log('연결 성공!');
}

function onClose(event) {
  console.log('연결 끊김!');
}

function onMessage(msg) {
  let data = msg.data;
  output.innerHTML += data + "\n";
  output.scrollTop = output.scrollHeight;
}

function sendMessage() {
  socket.send(input.value.trim());
  input.value = null;
}

input.addEventListener('keydown', (e) => {
  if (e.keyCode == 13) {
    if (e.shiftKey === true) {}
    else {
      e.preventDefault();
      sendMessage();
    }
  }
});

sendBtn.addEventListener('click', sendMessage);