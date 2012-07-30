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
	var allvars = getUrlVars();	
	if (allvars == 'http://localhost:3000/lista-cursos')
		;
	else		
		var okallvars = getUrlVars();
	
      $.ajax({
        url: 'get_next_results.js',
        type: 'get',
        data: {'page': p, '': okallvars},
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

function getUrlVars()
{
    
    var vars = window.location.href.slice(window.location.href.indexOf('?') + 1);
		
    	return vars;
}
