function changeUiColor() {

    let currentUserTag = document.querySelector('.current-user-tag');

    console.log(currentUserTag.firstElementChild)

    if (currentUserTag.firstElementChild.innerHTML === "Try-Hard") {
        document.documentElement.style.setProperty('--main-color', 'rgba(255, 111, 0, 1)');
        document.documentElement.style.setProperty('--main-color-shadow', 'rgba(255, 111, 0, 0.15)');
    };

    if (currentUserTag.firstElementChild.innerHTML === "Peer-Gaming") {
        document.documentElement.style.setProperty('--main-color', 'rgba(9, 188, 138, 1)');
        document.documentElement.style.setProperty('--main-color-shadow', 'rgba(9, 188, 138, 0.15)');
    };

    if (currentUserTag.firstElementChild.innerHTML === "Relax") {
        document.documentElement.style.setProperty('--main-color', 'rgba(38, 114, 235, 1)');
        document.documentElement.style.setProperty('--main-color-shadow', 'rgba(92, 128, 188, 0.25)');
    };

}

changeUiColor()