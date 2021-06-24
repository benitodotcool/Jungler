function btnRefresh() {

    let btnPeer = document.querySelector('#peer-gaming-btn');
    let btnRelax = document.querySelector('#relax-btn');
    let btnTryhard = document.querySelector('#tryhard-btn');

    console.log(btnPeer)
    console.log(btnRelax)
    console.log(btnTryhard)

    function reload() {
        reload = location.reload();
    }

    btnPeer.addEventListener("click", reload, false);
    btnRelax.addEventListener("click", reload, false);
    btnTryhard.addEventListener("click", reload, false);

}

btnRefresh()