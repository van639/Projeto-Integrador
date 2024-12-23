﻿var swiper = new Swiper(".slide-content", {
    slidesPerView: 3,
    spaceBetween: 25,
    loop: true,
    centerSlides: true,
    effect: 'true',
    grabCursor: true,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
        dynamicBullets: true,
    },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },

    breakpoints: {
        0: {
            slidesPerView: 1,
        },
        520: {
            slidesPerView: 2,
        },
        950: {
            slidesPerView: 3,
        },
    },
});

const SaibaMaisBtn = document.querySelectorAll(".button");


SaibaMaisBtn.forEach((btn) =>
    btn.addEventListener('click', (event) => {
        window.location.replace("OngHistoria/quemsomos.html");
    })
);