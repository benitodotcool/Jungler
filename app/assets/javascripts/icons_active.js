//*** ADD ACTIVE CLASS TO CONTAINER-ICON ONCLICK  ***//

function iconsActive() {

    var homeIcon = document.getElementById('home-add');
    var arrowIcon = document.getElementById('arrow-add');
    var messageIcon = document.getElementById('message-add');
    var categoryIcon = document.getElementById('category-add');
    var discoveryIcon = document.getElementById('discovery-add');

    // console.log(homeIcon);
    // console.log(arrowIcon);
    // console.log(messageIcon);
    // console.log(categoryIcon);
    // console.log(discoveryIcon);

    // homeIcon.addEventListener('click', function() {
    //     arrowIcon.classList.remove("permanent");
    //     messageIcon.classList.remove("permanent");
    //     categoryIcon.classList.remove("permanent");
    //     discoveryIcon.classList.remove("permanent");
    //     this.classList.add("permanent");
    // });

    arrowIcon.addEventListener('click', function() {

        messageIcon.classList.remove("permanent");
        categoryIcon.classList.remove("permanent");
        discoveryIcon.classList.remove("permanent");
        homeIcon.classList.remove("permanent");
        this.classList.add("permanent");
        
    });

    messageIcon.addEventListener('click', function() {
        arrowIcon.classList.remove("permanent");
        categoryIcon.classList.remove("permanent");
        discoveryIcon.classList.remove("permanent");
        homeIcon.classList.remove("permanent");
        this.classList.add("permanent");
    });

    categoryIcon.addEventListener('click', function() {
        this.classList.add("permanent");
        arrowIcon.classList.remove("permanent");
        messageIcon.classList.remove("permanent");
        discoveryIcon.classList.remove("permanent");
        homeIcon.classList.remove("permanent");
    });

    discoveryIcon.addEventListener('click', function() {
        arrowIcon.classList.remove("permanent");
        messageIcon.classList.remove("permanent");
        categoryIcon.classList.remove("permanent");
        homeIcon.classList.remove("permanent");
        this.classList.add("permanent");
    });

}

iconsActive()