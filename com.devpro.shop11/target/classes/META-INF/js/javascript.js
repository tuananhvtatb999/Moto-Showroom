$('#show-menu-mobi').on('click', function(event){
	event.stopPropagation();
	$('.menu').css('left', 0);
});

$('.menu').on('click', function(event){
    event.stopPropagation();
});


$('#icon-close').on('click', function(event){
    event.stopPropagation();
    $('.menu').css('left', "-350px");
});

$('.carousel').carousel({
  interval: 3000
})
$('#show-category').on('click', function(){
    $('.nav-pro').css('left', 0);
    $('#close-nav').css('left','300px');
});
$('#close-nav').on('click', function(event){
	event.stopPropagation();
    $('.nav-pro').css('left', "-350px");
    $(this).css('left','-100px');
});
$('.items-container').slick({
	infinite: true,
	autoplay: true,
    prevArrow: $('#pre'),
    nextArrow: $('#next'),
		autoplaySpeed: 2000,
		slidesToShow: 4,
		responsive: [
                {
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 4,
                    }
                },
                {
                    breakpoint: 991,
                    settings: {
                        slidesToShow: 3,
                    }
                },
                {
                    breakpoint: 768,
                    settings: {
                        slidesToShow: 2,
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 1,
                    }
                }
       ]
});
var angle=0;
$(document).ready(function() {
       $('#show-cate').click(function() {
            angle += 180;
            $('.cate').toggle("slide");
            $('#arrow').css('transform','rotate(' + angle + 'deg)');
       });
});


$(window).bind('scroll', function () {
    if ($(window).scrollTop() > 70) {
        $('.menu').addClass('fixed');
    } else {
        $('.menu').removeClass('fixed');
    }
});

$(document).ready(function(){
    $(window).scroll(function(){
        if ($(this).scrollTop() > 100) {
            $('#on_top').fadeIn();
        } else {
            $('#on_top').fadeOut();
        }
    });
    $('#on_top').click(function(){
        $("html, body").animate({ scrollTop: 0 }, 600);
        return false;
    });
});