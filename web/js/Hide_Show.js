
$(document).ready(function(){	
	if($("#drpEvents").val()!=="- - - - SELECT EVENT - - - -"){
		
		$('#drpParticipation').show();
		
	}else{
		$('#drpParticipation').empty();
	}
});

