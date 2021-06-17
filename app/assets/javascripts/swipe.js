function swipeCard () {

    var cardContainer = document.querySelector('.swipe-wrapper');
    var allCards = document.querySelectorAll('.swipe-cards');
    var firstCard = cardContainer.firstElementChild;
    var btnYes = document.getElementById('yes');
    var btnNo = document.getElementById('no');

    console.log(cardContainer)
    console.log(firstCard)
    console.log(btnYes)
    console.log(allCards)

    // btnYes.addEventListener('click', function (){

    //     firstCard.remove();

    //     var newCard = document.createElement("div");
    //     var newTitle = document.createElement("H1");

    //     newTitle.innerHTML = "Test";

    //     newCard.classList.add('swipe-cards');
    //     newCard.appendChild(newTitle);

    //     cardContainer.appendChild(newCard);

    // })

    btnYes.addEventListener('click', function() {

        allCards = [...allCards]
        allCards.shift();

        var newCard = document.createElement("div");
        var newTitle = document.createElement("H1");

        newTitle.innerHTML = "Test";

        newCard.classList.add('swipe-cards');
        newCard.appendChild(newTitle);

        allCards.push(newCard);


        var newHtml = "";
        allCards.forEach(element => {
            newHtml += element.outerHTML;                    
        });

        cardContainer.innerHTML = newHtml;

    })

    btnNo.addEventListener('click', function() {

        allCards = [...allCards]
        allCards.shift();

        var newCard = document.createElement("div");
        var newTitle = document.createElement("H1");

        newTitle.innerHTML = "Test";

        newCard.classList.add('swipe-cards');
        newCard.appendChild(newTitle);

        allCards.push(newCard);

        var newHtml = "";
        allCards.forEach(element => {
            newHtml += element.outerHTML;                    
        });

        cardContainer.innerHTML = newHtml;

    })

}    

swipeCard()