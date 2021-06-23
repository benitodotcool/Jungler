function swipeColor() {

    var peerBtn = document.getElementById('peer-gaming-btn');
    var relaxBtn = document.getElementById('relax-btn');
    var tryhardBtn = document.getElementById('tryhard-btn');

   
    peerBtn.addEventListener('click', function(){
        document.documentElement.style.setProperty('--main-color', 'rgba(9, 188, 138, 1)');
        document.documentElement.style.setProperty('--main-color-shadow', 'rgba(9, 188, 138, 0.15)');
    });

    relaxBtn.addEventListener('click', function(){
        document.documentElement.style.setProperty('--main-color', 'rgb(38, 114, 235)');
        document.documentElement.style.setProperty('--main-color-shadow', 'rgba(92, 128, 188, 0.15)');
    });

    tryhardBtn.addEventListener('click', function(){
        document.documentElement.style.setProperty('--main-color', 'rgba(255, 111, 0, 1)');
        document.documentElement.style.setProperty('--main-color-shadow', 'rgba(255, 111, 0, 0.15)');
    });

}

swipeColor()