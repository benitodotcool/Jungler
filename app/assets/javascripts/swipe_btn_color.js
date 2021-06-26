function swipeBtnColor() {

    let peerBtn = document.querySelector('#active-peer');
    let relaxBtn = document.querySelector('#active-relax');
    let tryhardBtn = document.querySelector('#active-tryhard');
    let currentUserTag = document.querySelector('.current-user-tag');

    if (currentUserTag.firstElementChild.innerHTML === "Try-Hard") {
        tryhardBtn.classList.add('active-state-try-hard');
    };

    if (currentUserTag.firstElementChild.innerHTML === "Peer-Gaming") {
        peerBtn.classList.add('active-state-peer-gaming');
    };

    if (currentUserTag.firstElementChild.innerHTML === "Relax") {
        relaxBtn.classList.add('active-state-relax');
    };

}

swipeBtnColor()