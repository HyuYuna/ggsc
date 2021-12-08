$(function(){
	$('.banner-box-01 li').mouseover(function(){
		$('.banner-box-01 img').each(function(){
			$(this).attr('src', $(this).attr('src').replace('_hover',''));
		});
		$(this).find('img')[0].src = $(this).find('img').attr('src').replace('.png','_hover.png');
		
	});
	$('.banner-box-01 li').mouseout(function(){
		$('.banner-box-01 img').each(function(){
			$(this).attr('src', $(this).attr('src').replace('_hover',''));
		});
	});
	
	$('.banner-box-02 li').mouseover(function(){
		$('.banner-box-02 img').each(function(){
			$(this).attr('src', $(this).attr('src').replace('_hover',''));
		});
		$(this).find('img')[0].src = $(this).find('img').attr('src').replace('.png','_hover.png');
	});
	$('.banner-box-02 li').mouseout(function(){
		$('.banner-box-02 img').each(function(){
			$(this).attr('src', $(this).attr('src').replace('_hover',''));
		});
	});

	$(".board-list > ul").mouseover(function(){
		const parent = $(this);
		$(".board-list > ul .board-text").removeClass('mouseover');
		parent.find('.board-text').addClass('mouseover');
	});
	$(".board-list > ul").mouseout(function(){
		const parent = $(this);
		$(".board-list > ul .board-text").removeClass('mouseover');
	});

	var swiper = new Swiper(".mySwiper", {
        slidesPerView: 5,
        spaceBetween: 30,
        navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		  },
      });
	
	


	  $('.site-select > li').click(function(){
			$('.site-select-list').toggle();
	  });

	 /* $(".map_img").click(function(e){
			var x = e.originalEvent.layerX;
			var y = e.originalEvent.layerY;

			if( x >= 149 && x <= 210 && y >=163 && y <= 216){ // 남양주
				$('.map_marker').hide();
				$('.map_namyangju').show();
				$('#nowMap').text('남양주');
			}
			console.log(e.originalEvent.layerX + '/' + e.originalEvent.layerY);
		}); */

});