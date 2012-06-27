function getBodyScrollTop()
{
  return self.pageYOffset || (document.documentElement && document.documentElement.scrollTop) || (document.body && document.body.scrollTop);
}

jQuery(function($) {


$(document).ready(function() {
  	$('.wbg').height($(document).height());
	
	$('.mainmenu li').each(function(index) {
		var thisTitle = $(this).find('a').attr('title');
		if (thisTitle !== undefined) {
			$(this).append('<span>'+thisTitle+'</span>');
		}
	});
	
	/*$("#mainmenu_responsive select").change(function() {
		window.location = $(this).find("option:selected").val();
	});*/
	
	$(".img_hov").hover(function(){
		var info=$(this).find("img");
		info.stop().animate({opacity:0.8},300);
		},
		function(){
		var info=$(this).find("img");
		info.stop().animate({opacity:1},300);
	});
	
	/* PRETTY PHOTO */
	$("a[rel^='prettyPhoto']").prettyPhoto({
		animation_speed: 'fast', /* fast/slow/normal */
		slideshow: 5000, /* false OR interval time in ms */
		autoplay_slideshow: false, /* true/false */
		opacity: 0.80, /* Value between 0 and 1 */
		show_title: true, /* true/false */
		allow_resize: true, /* Resize the photos bigger than viewport. true/false */
		default_width: 500,
		default_height: 344,
		counter_separator_label: '/', /* The separator for the gallery counter 1 "of" 2 */
		theme: 'pp_default', /* light_rounded / dark_rounded / light_square / dark_square / facebook */
		horizontal_padding: 20, /* The padding on each side of the picture */
		hideflash: false, /* Hides all the flash object on a page, set to TRUE if flash appears over prettyPhoto */
		wmode: 'opaque', /* Set the flash wmode attribute */
		autoplay: true, /* Automatically start videos: True/False */
		modal: false, /* If set to true, only the close button will close the window */
		deeplinking: true, /* Allow prettyPhoto to update the url to enable deeplinking. */
		overlay_gallery: true, /* If set to true, a gallery will overlay the fullscreen image on mouse over */
		keyboard_shortcuts: true, /* Set to false if you open forms inside prettyPhoto */
		changepicturecallback: function(){}, /* Called everytime an item is shown/changed */
		callback: function(){}, /* Called when prettyPhoto is closed */
		ie6_fallback: true,
		markup: '<div class="pp_pic_holder"> \
					<div class="ppt">&nbsp;</div> \
					<div class="pp_top"> \
						<div class="pp_left"></div> \
						<div class="pp_middle"></div> \
						<div class="pp_right"></div> \
					</div> \
					<div class="pp_content_container"> \
						<div class="pp_left"> \
						<div class="pp_right"> \
							<div class="pp_content"> \
								<div class="pp_loaderIcon"></div> \
								<div class="pp_fade"> \
									<a href="#" class="pp_expand" title="Expand the image">Expand</a> \
									<div class="pp_hoverContainer"> \
										<a class="pp_next" href="#">next</a> \
										<a class="pp_previous" href="#">previous</a> \
									</div> \
									<div id="pp_full_res"></div> \
									<div class="pp_details"> \
										<div class="pp_nav"> \
											<a href="#" class="pp_arrow_previous">Previous</a> \
											<p class="currentTextHolder">0/0</p> \
											<a href="#" class="pp_arrow_next">Next</a> \
										</div> \
										<p class="pp_description"></p> \
										{pp_social} \
										<a class="pp_close" href="#">Close</a> \
									</div> \
								</div> \
							</div> \
						</div> \
						</div> \
					</div> \
					<div class="pp_bottom"> \
						<div class="pp_left"></div> \
						<div class="pp_middle"></div> \
						<div class="pp_right"></div> \
					</div> \
				</div> \
				<div class="pp_overlay"></div>',
		gallery_markup: '<div class="pp_gallery"> \
							<a href="#" class="pp_arrow_previous">Previous</a> \
							<div> \
								<ul> \
									{gallery} \
								</ul> \
							</div> \
							<a href="#" class="pp_arrow_next">Next</a> \
						</div>',
		image_markup: '<img id="fullResImage" src="{path}" />',
		flash_markup: '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="{width}" height="{height}"><param name="wmode" value="{wmode}" /><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="movie" value="{path}" /><embed src="{path}" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="{width}" height="{height}" wmode="{wmode}"></embed></object>',
		quicktime_markup: '<object classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab" height="{height}" width="{width}"><param name="src" value="{path}"><param name="autoplay" value="{autoplay}"><param name="type" value="video/quicktime"><embed src="{path}" height="{height}" width="{width}" autoplay="{autoplay}" type="video/quicktime" pluginspage="http://www.apple.com/quicktime/download/"></embed></object>',
		iframe_markup: '<iframe src ="{path}" width="{width}" height="{height}" frameborder="no"></iframe>',
		inline_markup: '<div class="pp_inline">{content}</div>',
		custom_markup: '',
		social_tools: '<div class="pp_social"><div class="twitter"><a href="http://twitter.com/share" class="twitter-share-button" data-count="none">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script></div><div class="facebook"><iframe src="http://www.facebook.com/plugins/like.php?locale=en_US&href='+location.href+'&amp;layout=button_count&amp;show_faces=true&amp;width=500&amp;action=like&amp;font&amp;colorscheme=light&amp;height=23" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:500px; height:23px;" allowTransparency="true"></iframe></div></div>' /* html or false to disable */
	});
	
	
});



$(window).load(function() {

	$('.sub-menu li').addClass('noLava');
	$('.current-menu-item').not('.noLava').addClass('selectedLava');
	
    $(function() { $(".mainmenu_cont ul.mainmenu").lavaLamp({ fx: "backout", speed: 400 })});
	
	$(".carouselslider").carousel({
		dispItems: 1
	});
	
	$('.flexslider').flexslider({
		touchSwipe: true,     
		controlNav: true,
		slideshow: true,                
		slideshowSpeed: 7000,
		animationDuration: 600, 
		randomize: false, 
		pauseOnAction: true,    
		pauseOnHover: false
	});
	
	/* CREATE RESPONSIVE MENU */
	$('.mainmenu_cont .mainmenu li').each(function(index) {
		var thisli = $(this).clone();
		thisli.find("ul").remove();
		$(".mainmenu_responsive .mainmenu .sub-menu").append(thisli);
	});
	
	/* START SUPERFISH */ 
	$('ul.mainmenu').superfish({ 
		delay:       1000,                            // one second delay on mouseout 
		animation:   {opacity:'show',height:'show'},  // fade-in and slide-down animation 
		speed:       'fast',                          // faster animation speed 
		autoArrows:  false,                           // disable generation of arrow mark-up 
		dropShadows: false                            // disable drop shadows 
	}); 
	
	
	/* OTHER */
	$('.gototop').click(function(){
		$('html, body').animate({ scrollTop:0 },500);
		return false;
	});
	
	/* Comment block default values */
	var namecapt = "Name*";
	var emailcapt = "Email*";
	var urlcapt = "Website";
	var commentcapt = "Comment";
	
	var commname = $(".commname input").val();
	var commemail = $(".commemail input").val();
	var commurl = $(".commurl input").val();
	var commcomment = $(".commcomment textarea").val();
	
	if (commname=="") {$(".commname input").val(namecapt);}
	if (commemail=="") {$(".commemail input").val(emailcapt);}
	if (commurl=="") {$(".commurl input").val(urlcapt);}
	if (commcomment=="") {$(".commcomment textarea").val(commentcapt);}
	
	$('.commname input').focus(function() {
		var commname = $(this).val();
		if (commname==namecapt) {$(".commname input").val("");}
	});
	$('.commemail input').focus(function() {
		var commemail = $(this).val();
		if (commemail==emailcapt) {$(".commemail input").val("");}
	});
	$('.commurl input').focus(function() {
		var commurl = $(this).val();
		if (commurl==urlcapt) {$(".commurl input").val("");}
	});
	$('.commcomment textarea').focus(function() {
		var commcomment = $(this).val();
		if (commcomment==commentcapt) {$(".commcomment textarea").val("");}
	});
	
	$('.commname input').blur(function() {
		var commname = $(this).val();
		if (commname=="") {$(".commname input").val(namecapt);}
	});
	$('.commemail input').blur(function() {
		var commemail = $(this).val();
		if (commemail=="") {$(".commemail input").val(emailcapt);}
	});
	$('.commurl input').blur(function() {
		var commurl = $(this).val();
		if (commurl=="") {$(".commurl input").val(urlcapt);}
	});
	$('.commcomment textarea').blur(function() {
		var commcomment = $(this).val();
		if (commcomment=="") {$(".commcomment textarea").val(commentcapt);}
	});
	
	/* POPULAR RECENT TAGS */
	$('.switch div').click(function(){
		$('.switch div').removeClass("active");
		$(this).addClass("active");
		if ($(this).html() == "Popular") {$(".poprecent").hide();$(".wpopular").fadeIn('slow');}
		if ($(this).html() == "Recent") {$(".poprecent").hide();$(".wrecent").fadeIn('slow');}
		if ($(this).html() == "Tags") {$(".poprecent").hide();$(".wtags").fadeIn('slow');}
	});
	
	$('#twitter_update_list li > a').addClass('metatweet');
	
	
	$(".tiptip").tipTip({
	defaultPosition: "top"
	});
	
	
	/* Mainslider subcaptopn center  */
	var slideh = $(".flexslider .slides").height();
	//alert(slideh);
	$(".flexslider .slides li").each(function(index) {
		$(this).find(".flccont").css("height", slideh);
	});
	
	/* Activate preloader */
	$(".preloader_container").preloader();
	
	/* Portfolio filter */
	$('ul#filter a').click(function() {
		$(this).css('outline','none');
		$('ul#filter .act').removeClass('act');
		$(this).parent().addClass('act');
		
		var filterVal = $(this).text().toLowerCase().replace(new RegExp(" ",'g'),"-");
				
		if(filterVal == 'all') {
		
			$('.all').animate({
				opacity: 0
			}, 500, function() {
				$('.all').addClass('hidden');
			});
		
			$('.all').animate({
				opacity: 1
			}, 500, function() {
				$('.all').removeClass('hidden');
			});
		} else {
			$('.portrowed > div').each(function() {
				if(!$(this).hasClass(filterVal)) {
				
					$(this).animate({
						opacity: 0
					}, 500, function() {
						$(this).addClass('hidden');
					});
					
				} else {

					$(this).animate({
						opacity: 1
					}, 500, function() {
						$(this).removeClass('hidden');
					});
					
				}
			});
		}
	
		return false;
	});
	
	
	/* AJAX FEEDBACK */ 
	$(".ajax_send_feedback").click(function(){
	
		var rootcont = $(this).parents("#comment-form");
		
		var sendername = rootcont.find(".sendername").val();
		var senderemail = rootcont.find(".senderemail").val();
		var feedback_url = rootcont.find(".feedback_url").val();
		var sendermessage = rootcont.find(".sendermessage").val();
	
		var data = {
			sendername: sendername,
			senderemail: senderemail,
			feedback_url: feedback_url,
			sendermessage: sendermessage,
			action: 'send_feedback'
		};
		
		$.post(mixajaxurl, data, function(response) {
			rootcont.find(".ajaxresponse").hide().empty().append(response).fadeIn("1000");
		});
	
	});
	
	
});


});