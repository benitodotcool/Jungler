function messageMargin() {

    let allMessages = document.querySelectorAll('.message');

    allMessages.forEach((message) => {        

        if (message.classList.contains('message-send') && message.nextElementSibling.classList.contains('message-received')) {
            message.classList.add('message-margin');
        }

        if (message.classList.contains('message-received') && message.nextElementSibling.classList.contains('message-send')) {
            message.classList.add('message-margin');
        }

    });

}

messageMargin()