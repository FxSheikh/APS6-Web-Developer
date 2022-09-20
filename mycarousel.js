// JavaScript Carousel with Automatic and Manual controls

let slideIndex = 1;
let myTimer;

const slideshowContainer = document.querySelector('.slideshow-container');
const nextButton = document.getElementById("nextbutton");
const previousButton = document.getElementById("previousbutton");

window.addEventListener("load", function () {
    // console.log('test')
    showSlides(slideIndex);
    myTimer = setInterval(function () { plusSlides() }, 4000);
})

function showSlides(n) {
    let i;
    let slides = document.getElementsByClassName("mySlides");
    let dots = document.getElementsByClassName("dot");
    if (n > slides.length) { slideIndex = 1; }
    if (n < 1) { slideIndex = slides.length; }
    for (i = 0; i < slides.length; i += 1) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex - 1].style.display = "block";
    dots[slideIndex - 1].className += " active";
}

function setTimer(n) {
    clearInterval(myTimer);
    showSlides(slideIndex = n);
    myTimer = setInterval(function () { plusSlides() }, 4000);
}

function currentSlide(slideIndexNumber) {
    setTimer(n = slideIndexNumber);
}

function plusSlides() {
    setTimer(slideIndex += 1);
}

function minusSlides() {
    setTimer(slideIndex -= 1);
}

pause = () => {
    clearInterval(myTimer);
}

resume = () => {
    clearInterval(myTimer);
    myTimer = setInterval(function () { plusSlides() }, 4000);
}

nextButton.addEventListener("click", plusSlides);
previousButton.addEventListener("click", minusSlides);

nextButton.addEventListener("mouseenter", resume);
previousButton.addEventListener("mouseenter", resume);

slideshowContainer.addEventListener('mouseenter', pause)
slideshowContainer.addEventListener('mouseleave', resume)

// clearInterval(myTimer)
// showSlides(slideIndex -= 1);
// myTimer = setInterval(function () { plusSlides() }, 4000);