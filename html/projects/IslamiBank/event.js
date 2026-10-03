let slideIndex = 1;
showSlides(slideIndex);

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("slideButton");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" slide-button-bgColour", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " slide-button-bgColour";
  setTimeout(showSlides, 3000); // Change image every 2 seconds
}