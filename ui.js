$(document).ready(function() {
    window.addEventListener('message', function(event) {
        var data = event.data;
        $("#boxStamina").css("height",data.stamina + "%");
        if (event.data.action == "updateStatus") {
            updateStatus(event.data.st);
        } else if (event.data.action == "toggleCar"){
			if (event.data.show){
				$('.playerStats').css('transition', 'left 1s');
				$('.playerStats').css('left', '28.5vh');
			} else{
				$('.playerStats').css('transition', 'left 1s');
				$('.playerStats').css('left', '2.65vh');
			}
		} else if (event.data.action == "notify"){
			if (event.data.show){
				$('.playerStats').css('transition', 'opacity 0.5s');
				$('.playerStats').css('opacity', '0');
			} else{
				$('.playerStats').css('transition', 'opacity 0.5s');
				$('.playerStats').css('opacity', '1');
			}
		}
    })
})

$(function(){
	window.addEventListener('message', function(event) {
		if (event.data.action == "toggle"){
			if (event.data.show){
				$('#ui').show();
			} else{
				$('#ui').hide();
			}
		}
	});

});

function updateStatus(status){
    $('#boxHunger').css('height', status[0].percent+'%')
    $('#boxThirst').css('height', status[1].percent+'%')
}

$(function() {
    var $heal = $("#boxHealth");
    var $armor = $("#boxArmor");
    var $voice = $("#boxVoice")
    window.addEventListener('message', function(event){
        $heal.css("height", (event.data.heal-100)+"%");
    }); 
});
