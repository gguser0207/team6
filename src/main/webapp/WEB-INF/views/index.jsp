<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/style.css">
  <title>team6</title>
</head>
<body>
  <div class="slider">
    <div class="slide" style="background-image: url(./1.jpg);"></div>
    <div class="slide" style="background-image: url(./2.jpg);"></div>
    <div class="slide" style="background-image: url(./3.jpg);"></div>
    <a class="prev" onclick="button_click(-1)">&#10094</a>
    <a class="next" onclick="button_click(1)">&#10095</a>
  </div>
  <DIV class='bottom'>
    이현수[PL]   임동규[DA]   송은호[AI]   유성용[WP] 
  </DIV>
  <script>
    let currSlide = 1;
    showSlide(currSlide);
    function button_click(num){
      showSlide((currSlide += num))
    }
    function showSlide(num){
      const slides = document.querySelectorAll(".slide");
      if(num>slides.length){
        currSlide=1;
      } if(num<1){
        currSlide = slides.length;
      }
      for(let i=0; i<slides.length; i++){
        slides[i].style.display="none";
      }slides[currSlide -1].style.display="block";
    }

  </script>

</body>
</html>
