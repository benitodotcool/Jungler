function navAction() {

    let homeIcon = document.getElementById('home-add');
    let arrowIcon = document.getElementById('arrow-add');
    let messageIcon = document.getElementById('message-add');
    let categoryIcon = document.getElementById('category-add');
    let discoveryIcon = document.getElementById('discovery-add');
    let mainContainer = document.querySelector('main');

    // console.log(homeIcon);
    // console.log(arrowIcon);
    // console.log(messageIcon);
    // console.log(categoryIcon);
    // console.log(discoveryIcon);
    // console.log(mainContainer);

    if (mainContainer.id === 'landing_page-focus') {
        homeIcon.classList.add("permanent");
        arrowIcon.classList.remove("permanent");
        messageIcon.classList.remove("permanent");
        categoryIcon.classList.remove("permanent");
        discoveryIcon.classList.remove("permanent");
    };

    if (mainContainer.id === 'users-focus') {
        arrowIcon.classList.add("permanent");
        homeIcon.classList.remove("permanent");
        messageIcon.classList.remove("permanent");
        categoryIcon.classList.remove("permanent");
        discoveryIcon.classList.remove("permanent");
    };

    if (mainContainer.id === 'conversation-focus') {
        messageIcon.classList.add("permanent");
        homeIcon.classList.remove("permanent");
        arrowIcon.classList.remove("permanent");
        categoryIcon.classList.remove("permanent");
        discoveryIcon.classList.remove("permanent");
    };

    if (mainContainer.id === 'category-focus') {
        categoryIcon.classList.add("permanent");
        homeIcon.classList.remove("permanent");
        arrowIcon.classList.remove("permanent");
        messageIcon.classList.remove("permanent");
        discoveryIcon.classList.remove("permanent");
    };

    if (mainContainer.id === 'discovery-focus') {
        discoveryIcon.classList.add("permanent");
        homeIcon.classList.remove("permanent");
        arrowIcon.classList.remove("permanent");
        messageIcon.classList.remove("permanent");
        categoryIcon.classList.remove("permanent");
    };

}

navAction()