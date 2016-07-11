$(document).ready(function(){
	 $(function(){
		$('.back-top').click(function(){
			$('body,html').animate({
					scrollTop:0}, 500);
			return false;
		});
	});

		$(function($){
				$(document).on('click', 'a[href^=#]', function () {
						$('html, body').animate({ scrollTop: $('a[name="'+this.hash.slice(1)+'"]').offset().top }, 1000 ); 
				return false;
				});
		});
});