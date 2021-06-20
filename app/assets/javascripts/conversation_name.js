function conversationCurrent() {

    var allConversations = document.querySelectorAll('.conversation-name');

    console.log(allConversations)

    allConversations.forEach((conversation) => {        

        conversation.addEventListener('click', function() {
            
            allConversations.classList.remove('current');
            conversation.classList.add('current');

        })

    });

}

conversationCurrent()