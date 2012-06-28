<?php header("Content-type: text/css"); 
$wp_include = "../../../../wp-load.php";
$i = 0;
while (!file_exists($wp_include) && $i++ < 10) {
	$wp_include = "../$wp_include";
}

require($wp_include);
?>

body {
	color:#<?php echo get_theme_option("main_text"); ?>;
}
a, a:visited, a:link, .thispost a:hover {
	color:#<?php echo get_theme_option("main_links"); ?>;
}
a:hover, .thispost a {
	color:#<?php echo get_theme_option("main_links_hover"); ?>;
}
.mainmenu a {
	color:#<?php echo get_theme_option("menu_text"); ?>;
}
.mainmenu a:hover {
	color:#<?php echo get_theme_option("menu_text_hover"); ?>;
}
.mainmenu .current-menu-item a {
	color:#<?php echo get_theme_option("menu_text_active"); ?>;
}
.headofpage {
	color:#<?php echo get_theme_option("headings"); ?>;
}
.block_title {
	color:#<?php echo get_theme_option("block_titles"); ?>;
}
.post-title-cont .post-title a, .post-title-cont .post-title {
	color:#<?php echo get_theme_option("post_titles"); ?>;
}
.sf-menu li ul {
	background-color:#<?php echo get_theme_option("menu_bg"); ?>;
}
.block_shadow, .shortcode_container.contbg, .cpt_sort ul li a {
	background-color:#<?php echo get_theme_option("content_block_bg_color"); ?>;
}
.footer {
	background-color:#<?php echo get_theme_option("footer_bg_color"); ?>;
}