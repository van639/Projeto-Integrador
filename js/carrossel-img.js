const gap = 8;

const carrossel = document.getElementById("carrossel"),
  content = document.getElementById("content"),
  next = document.getElementById("direita"),
  prev = document.getElementById("esquerda");

next.addEventListener("click", e => {
  carrossel.scrollBy(width + gap, 0);
  if (carrossel.scrollWidth !== 0) {
    prev.style.display = "flex";
  }
  if (content.scrollWidth - width - gap <= carrossel.scrollLeft + width) {
    next.style.display = "none";
  }
});
prev.addEventListener("click", e => {
  carrossel.scrollBy(-(width + gap), 0);
  if (carrossel.scrollLeft - width - gap <= 0) {
    prev.style.display = "none";
  }
  if (!content.scrollWidth - width - gap <= carrossel.scrollLeft + width) {
    next.style.display = "flex";
  }
});

let width = carrossel.offsetWidth;
window.addEventListener("resize", e => (width = carrossel.offsetWidth));
