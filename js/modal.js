const OpenModalBtn = document.getElementById("cadastro");
const closeModalBtn = document.querySelector("#close-modal");
const modal = document.querySelector("#modal");
const fade = document.querySelector("#fade");


closeModalBtn.addEventListener("click",() => {
    modal.style.display="none";
    fade.style.display="none";
});

OpenModalBtn.addEventListener('click', () =>{
    modal.style.display="flex";
    fade.style.display="block";
});

