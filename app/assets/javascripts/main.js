
$(document).ready(function() {
	$("#appstore_logo").hover(
		function() {
			$(this).attr("src", "/assets/appstore_logo_hover.png");
		}, 
		function() {
			$(this).attr("src", "/assets/appstore_logo.png");
	});

	$("div.small_team_disc").hover(
		function() {
			var old_size = $(this).height();
			var old_left = parseInt($(this).css("left"));
			var old_top = parseInt($(this).css("top"));

			$(this).addClass("large_team_disc");
			$(this).removeClass("small_team_disc");

			var new_size = $(this).height();
			var new_left = old_left - (new_size - old_size)/2;
			var new_top = old_top - (new_size - old_size)/2;


	 		$(this).css("top", new_top);
	 		$(this).css("left", new_left);

		},
		function() {
			var old_size = $(this).height();
			var old_left = parseInt($(this).css("left"));
			var old_top = parseInt($(this).css("top"));

			$(this).addClass("small_team_disc");
			$(this).removeClass("large_team_disc");

			var new_size = $(this).height();
			var new_left = old_left - (new_size - old_size)/2;
			var new_top = old_top - (new_size - old_size)/2;


	 		$(this).css("top", new_top);
	 		$(this).css("left", new_left);

		}
	);

	$("#appstore_logo_link").click(function(event){
  		if($("#sms_overlay").css("display") === "none") {
  			$("#sms_overlay").show();
  		}
  		else {
  		  	$("#sms_overlay").hide();

  		}
  		event.preventDefault(); // Prevent link from following its href
	});
	$("#sms_modal_close").click(function(event){
  		$("#sms_overlay").hide();
  		event.preventDefault(); // Prevent link from following its href
	});

});