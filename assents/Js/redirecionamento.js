const OpenModalBtn = document.querySelectorAll(".btn-querodoar");
const SaibaMaisBtn = document.querySelectorAll(".btn-saibamais");


OpenModalBtn.forEach((btn) =>
    btn.addEventListener('click', (event) => {
        window.location.replace("../tipoDeDoacao/index.html");
    })
);

SaibaMaisBtn.forEach((btn) =>
    btn.addEventListener('click', (event) => {
        window.location.replace("../OngHistoria/quemsomos.html");
    })
);