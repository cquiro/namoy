// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .



// Add a background to the navbar when scrolling down.
$(document).ready(function(){
  $(window).scroll(function() { // check if scroll event happened
    if ($(document).scrollTop() > 1) { // check if user scrolled more than 50 from top of the browser window
      $(".navbar-fixed-top").css("background", "rgba(65, 39, 18, 0.8)"); // if yes, then change the color of class "navbar-fixed-top" to white (#f8f8f8)
    } else {
      $(".navbar-fixed-top").css("background-color", "transparent"); // if not, change it back to transparent
    }
  });
});

// Filter the recipes by flavor
$(document).on('page:change', function(){
  $( "input" ).on( "click", function() {
    selection = $("input:checked").val();
    if (selection === "All") {
      $(".natural, .naranja, .limon").show();
    } 
    else if (selection === "natural") {
      $(".natural").show();
      $(".naranja, .limon").hide();
    } 
    else if (selection === "naranja") {
      $(".naranja").show();
      $(".natural, .limon").hide();
    } 
    else if (selection === "limon") {
      $(".limon").show();
      $(".naranja, .natural").hide();
    }
  });
});
 

// Underline the navbar link that corresponds to the page you are at.
$(document).on('page:change', function() {
  var path = location.pathname.split('/').pop();
  $('#navbar li a[href="/' + path + '"]').parent().addClass('active');
});



// Slider
$(document).on('page:change', function(){
  var currentIndex = 0,
    items = $('.panela-img div'),
    itemAmt = items.length;

  function cycleItems() {
    var item = $('.panela-img div').eq(currentIndex);
    items.hide();
    item.css('display','inline-block');
  }

  // var autoSlide = setInterval(function() {
  //   currentIndex += 1;
  //   if (currentIndex > itemAmt - 1) {
  //     currentIndex = 0;
  //   }
  //   cycleItems();
  // }, 3000);

  $('#next').click(function() {
    // clearInterval(autoSlide);
    currentIndex += 1;
    if (currentIndex > itemAmt - 1) {
      currentIndex = 0;
    }
    cycleItems();
  });

  $('#prev').click(function() {
    // clearInterval(autoSlide);
    currentIndex -= 1;
    if (currentIndex < 0) {
      currentIndex = itemAmt - 1;
    }
    cycleItems();
  });
});
















