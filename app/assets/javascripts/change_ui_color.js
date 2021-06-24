function changeUiColor() {

    let currentUserTag = document.querySelector('.current-user-tag');

    if (currentUserTag.innerHTML = "Try-Hard") {
        document.documentElement.style.setProperty('--main-color', 'rgba(255, 111, 0, 1)');
        document.documentElement.style.setProperty('--main-color-shadow', 'rgba(255, 111, 0, 0.15)');
    };

    if (currentUserTag.innerHTML = "relax") {
        document.documentElement.style.setProperty('--main-color', 'rgba(38, 114, 235, 1)');
        document.documentElement.style.setProperty('--main-color-shadow', 'rgba(38, 114, 235, 0.25)');
    };

    if (currentUserTag.innerHTML = "peer-gaming") {
        document.documentElement.style.setProperty('--main-color', 'rgba(9, 188, 138, 1)');
        document.documentElement.style.setProperty('--main-color-shadow', 'rgba(9, 188, 138, 0.15)');
    };



}

changeUiColor()