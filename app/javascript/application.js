// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "popper"
import "bootstrap"


$(document).ready(function(){
 
  $('.items').slick({
  infinite: true,
  lazyLoad: 'ondemand',
  slidesToShow: 3,
  slidesToScroll: 3
  });
});