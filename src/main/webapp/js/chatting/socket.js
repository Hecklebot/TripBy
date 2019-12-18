let socket = new SockJS('/tripby/socketHandler');
socket.onopen = onOpen;
socket.onmessage = onMessage;
socket.onclose = onClose;