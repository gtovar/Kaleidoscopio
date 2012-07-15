$(document).ready(
  function() {
   
    $("#loading-spinner").bind("ajaxSend", function() {
	        $(this).show();
	    }).bind("ajaxStop", function() {
	        $(this).hide();
	    }).bind("ajaxError", function() {
	        $(this).hide();
	    });

    var p = 1;
  
    function last_msg_function() {
      $.ajax({
        url: 'get_next_results.js',
        type: 'get',
        data: {'page': p},
        async: true,
        dataType: 'html',
        success: function(data){
            $('#course_results').append(data);         
        }
      });			
    };

    $(window).scroll(
      function() {
        if (($(document).height() - $(window).height()) <= $(window).scrollTop()){
          if ($("#no_more_course_results").size() == 0) {
            p = p + 1;
            last_msg_function();
          }
        }
      }
    );
  }
);

