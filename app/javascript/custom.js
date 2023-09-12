
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



$(document).ready(function(){


$('.multiple-items').slick({
  infinite: true,
  slidesToShow: 4,
  slidesToScroll: 4,
  speed:200,
  autoplay:true,
  autoplaySpeed:2000
});


});



$(document).on('turbo:before-cache', function() {
  const sliders = document.querySelectorAll('.slick-initialized');
 
  sliders.forEach(item => {
    $(item).slick('unslick');
  })
});



$(document).ready(function(){

    $('.additemtowish').each(function(e) {
      $(this).click(function() { 
          var d = $(this).data("id")
          $.ajax({
            url: `/wish_lists/${d}/additem`,
            method: "GET",
            success: function(res) {
              var wishlistError = $('#custom-toast')
              wishlistError.show()
              if (res.alreadyAdded)
              {
                  wishlistError.html('Already WishListed')
              }
              else{
                    wishlistError.html('Added to your wishlist')
              } 
              
              setTimeout(function(){
                 wishlistError.html("")
                 wishlistError.hide()
                 location.reload(true);
              },2000)
            },
            error: function(res){
                var wishlistError = $('#custom-toast')
                wishlistError.show()
                wishlistError.html('You need to sign in or sign up')
                 setTimeout(function(){
                 wishlistError.html("")
                 wishlistError.hide()
                },3000)

            }
          })

      })
      
        // $(this).html("unfollow");
        // $(this).addClass('unfollow-btn')
      
    }) 
})