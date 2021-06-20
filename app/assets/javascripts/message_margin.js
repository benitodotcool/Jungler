function messageMargin() {

    let allMessages = document.querySelectorAll('.message');

    allMessages.forEach((message) => {

        let nextMessage = message.nextSibling;

        if message.classList.contains('message-send') && nextMessage.classList.contains('message-received'){
            message.classList.add('message-margin');
        }
    });


}

messageMargin()