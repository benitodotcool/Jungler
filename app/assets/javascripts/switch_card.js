function hideContent(){

    var btnShow = document.querySelector("#btn-show-profile");
    var btnEdit = document.querySelector("#btn-edit-profile");
    var userShow = document.querySelector('.user-show');
    var userEdit = document.querySelector('.user-edit');

    btnShow.addEventListener("click", function(){
        userShow.classList.add('hidden');
        userEdit.classList.remove('hidden');
    });

    btnEdit.addEventListener("click", function(){
        userEdit.classList.add('hidden');
        userShow.classList.remove('hidden');
    });

}


hideContent()
