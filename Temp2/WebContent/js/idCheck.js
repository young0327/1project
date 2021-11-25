
	let idcheck = false;
	let inputcheck = false;
	
	let joinCheck =  function(){
		
		if(idcheck && inputcheck){
			$('input[type="submit"]').attr('disabled', false)
		}else{
			$('input[type="submit"]').attr('disabled', true)
		}
		
	}
	
	
	$('#checkId').on('click',function(){
	
		let id = $('#id').val()
		
		$.ajax({
		
			url : "../CheckIdService",
			data : {id: id},
			dataType : 'json',
			success : function(result){
				if(result==true){
					$('.idCheck').html("<span>중복된 아이디입니다.</span>").css("color","red")
					console.log('중복된 아이디입니다.')
					idcheck=false;
				}else{
					$('.idCheck').html("<span>사용가능한 아이디입니다.</span>").css("color","green")
					console.log('사용가능한 아이디입니다.')
					idcheck = true;
				}
				joinCheck();

			},
			error : function(){
				console.log('실패')
			}
			
			
			
		})
		
		
	})
	
	$('input[type="text"]').on('change', function(){
			let inputs = $('input[type="text"]');
			for(let i = 0; i < inputs.length; i++){
				console.log(inputs[i])
				if($(inputs[i]).val() == ""){
					inputcheck = false;
				}else{
					inputcheck = true;
				}				
				
			}
			joinCheck();		
		})
	
	
