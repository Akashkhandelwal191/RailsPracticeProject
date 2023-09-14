

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
          var d1 = $(this)
          var d = $(this).data("id")
          $.ajax({
            url: `/wish_lists/${d}/additem`,
            method: "GET",
            success: function(res) {
              var wishlistError = $('#custom-toast')
              wishlistError.show()
              if (res.alreadyAdded)
              {   
                  wishlistError.css("background-color", "red");
                  wishlistError.html('Already WishListed')
                  $.ajax({
                        
                      url:`/wish_lists/${d}`,
                      method:"DELETE",
                      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
                      success: function(res){

                           wishlistError.html('Remove from your wishlist')
                           $(d1).children('i').removeClass('bi-heart-fill')
                           $(d1).children('i').addClass('bi-suit-heart')
                      }

                  })

              }
              else{

                    wishlistError.html('Added to your wishlist')
                    $(d1).children('i').removeClass('bi-suit-heart')
                    $(d1).children('i').addClass('bi-heart-fill')
                    $(d1).children('i').css("color","red")
                    // $(this).children[0].classList.remove('bi-suit-heart')
                    // $(this).children[0].classList.add('bi-heart-fill')
                    // $(this).children[0].css("color","red")

              } 
              
              setTimeout(function(){
                 wishlistError.html("")
                 wishlistError.hide()
                 // location.reload(true);
              },2000)
            },
            error: function(res){
                var wishlistError = $('#custom-toast')
                wishlistError.show()
                wishlistError.css("background-color", "red");
                wishlistError.html('You need to sign in or sign up before continuing')
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


$(document).ready(function(){


$('#add-review-trigger').click(function(){
   
     $('#review-f').toggleClass('review-form')
});


});




