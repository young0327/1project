	let inputcheck = false;
	
	let updateCheck =  function(){
		
		if(inputcheck){
			$('input[type="submit"]').attr('disabled', false)
		}else{
			$('input[type="submit"]').attr('disabled', true)
		}
		
	}
	
	
	$('input[type="text"]').on('change',  function(){
			let inputs = $('input[type="text"]');
			for(let i = 0; i < inputs.length; i++){
				console.log(inputs[i])
				if($(inputs[i]).val() == ''){
					inputcheck = false;
					break;
				}else{
					inputcheck = true;
				}				
				
			}
			updateCheck();		
		})
	
	