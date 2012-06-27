<?php
$featured_image = wp_get_attachment_image_src( get_post_thumbnail_id( get_the_ID() ), 'single-post-thumbnail' );
/* GET ALL META */
$portslides = get_post_meta($post->ID, "portslides", true);
$format_service_type = get_post_meta($post->ID, "format_service_type", true);
$featuredvideo = get_post_meta($post->ID, "featuredvideo", true);
$featuredaudio = get_post_meta($post->ID, "featuredaudio", true);
$featuredaudio_ogg = get_post_meta($post->ID, "featuredaudio_ogg", true);

if (is_array($portslides)) {
	foreach ($portslides as $key => $value) {
		if (strlen($value)>0) {$haveappimages=true;}
	}
}


/* IF FORMAT = IMAGE */
if ($pf=="image") {
	if ((strlen($featured_image[0])>0) || $haveappimages == true) {echo '<div class="flexslider singlepostslider"><ul class="slides">';}
	
	if (strlen($featured_image[0])>0) { ?><li><img class="feimage" alt='<?php echo get_the_title(); ?>' src='<?php echo TIMTHUMBURL; ?>?w=600&amp;h=220&amp;src=<?php echo $featured_image[0]; ?>'></li><?php }
	
	if ($haveappimages == true && is_array($portslides)) {
		foreach ($portslides as $key => $value) {
			echo "<li><img class='feimage' alt='".get_the_title()."' src='".TIMTHUMBURL."?w=600&amp;h=220&amp;src=".$value."'></li>";
		}
	}

	if ((strlen($featured_image[0])>0) || $haveappimages == true) { echo "</ul></div>"; }
	unset($haveappimages);
}
/* END IF FORMAT = IMAGE */



/* IF FORMAT = VIDEO */
if ($pf=="video" && strlen($featuredvideo)>0) {
	#youtube
	if ($format_service_type=="youtube") {
		echo "
		<iframe width=\"100%\" height=\"220\" src=\"http://www.youtube.com/embed/".$featuredvideo."\" frameborder=\"0\" allowfullscreen></iframe><div class='clear'></div>
		";
	}	
	#vimeo
	if ($format_service_type=="vimeo") {
		echo "
		<iframe src=\"http://player.vimeo.com/video/".$featuredvideo."\" width=\"100%\" height=\"220\" frameborder=\"0\" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe><div class='clear'></div>
		";
	}	
}
/* END IF FORMAT = IMAGE */



/* IF FORMAT = AUDIO */
if ($pf=="audio" && (strlen($featuredaudio)>0 || strlen($featuredaudio_ogg)>0)) {
	echo '
	<div class="AudioPlayerV1_cont">
		<audio class="AudioPlayerV1" width="100%" preload="none" data-fallback="'.THEMEROOTURL.'/ext/audioplayer/AudioPlayerV1.swf">';
	if (strlen($featuredaudio)>0) { echo '<source type="audio/mpeg" src="'.$featuredaudio.'" />'; }
	if (strlen($featuredaudio_ogg)>0) { echo '<source type="audio/ogg" src="'.$featuredaudio_ogg.'" />'; }
echo ' 			</audio>
	</div>
	';
}
/* END IF FORMAT = IMAGE */
?>