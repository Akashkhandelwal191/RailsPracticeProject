
$(document).ready(function(){
 
  $('.items').slick({
  infinite: true,
  lazyLoad: 'ondemand',
  autoplay:true,
  speed:200,
  autoplaySpeed: 2000,
  slidesToShow: 3,
  slidesToScroll: 3
  });
});

$(document).on('turbo:before-cache', function() {
  const sliders = document.querySelectorAll('.slick-initialized');
 
  sliders.forEach(item => {
    $(item).slick('unslick');
  })
});
