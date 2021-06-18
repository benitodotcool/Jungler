function navAction() {

    let homeIcon = document.getElementById('home-add');
    let arrowIcon = document.getElementById('arrow-add');
    let messageIcon = document.getElementById('message-add');
    let categoryIcon = document.getElementById('category-add');
    let discoveryIcon = document.getElementById('discovery-add');
    // var mainContainer = document.getElementById('main-id');

    console.log(homeIcon);
    console.log(arrowIcon);
    console.log(messageIcon);
    console.log(categoryIcon);
    console.log(discoveryIcon);
    // console.log(mainContainer);

    function homeIconAction() {    
        homeIcon.addEventListener('click', function() {
            arrowIcon.classList.remove("permanent");
            messageIcon.classList.remove("permanent");
            categoryIcon.classList.remove("permanent");
            discoveryIcon.classList.remove("permanent");
            this.classList.add("permanent");
        });
    }

    function arrowIconAction() {    
        arrowIcon.addEventListener('click', function() {
            homeIcon.classList.remove("permanent");
            messageIcon.classList.remove("permanent");
            categoryIcon.classList.remove("permanent");
            discoveryIcon.classList.remove("permanent");
            this.classList.add("permanent");
        });
    }

    function messageIconAction() {    
        messageIcon.addEventListener('click', function() {
            homeIcon.classList.remove("permanent");
            arrowIcon.classList.remove("permanent");
            categoryIcon.classList.remove("permanent");
            discoveryIcon.classList.remove("permanent");
            this.classList.add("permanent");
        });
    }

    function categoryIconAction() {    
        categoryIcon.addEventListener('click', function() {
            homeIcon.classList.remove("permanent");
            messageIcon.classList.remove("permanent");
            arrowIcon.classList.remove("permanent");
            discoveryIcon.classList.remove("permanent");
            this.classList.add("permanent");
        });
    }

    function discoveryIconAction() {    
        discoveryIcon.addEventListener('click', function() {
            homeIcon.classList.remove("permanent");
            messageIcon.classList.remove("permanent");
            arrowIcon.classList.remove("permanent");
            categoryIcon.classList.remove("permanent");
            this.classList.add("permanent");
        });
    }

    homeIconAction()
    arrowIconAction()
    messageIconAction()
    categoryIconAction()
    discoveryIconAction()

}

navAction()