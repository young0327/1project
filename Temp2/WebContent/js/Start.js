const endpoint=10;
let select=[];
let k = 0;
let index = 0;
let resultword=0;
let point = 0;
$(function(){
	
		  $("#confirm").click(function(){
		      modalClose();
		      //컨펌 이벤트 처리
		  });
		  $("#modal-open").click(function(){$(".popup-wrap").css('display','flex').hide().fadeIn();
		  });
		  $("#close").click(function(){
		      modalClose();
			
		  });
		
		  $("#testStart").mouseover(function(){
			  $("#testStart").css({
				  background:'#FF7F50'
			  })
		  })
		 
		  $("#testStart").mouseout(function(){
			  $("#testStart").css({
				  background:'#FF8C00'
				  })
			  })
		});
	 $("#testStart").click(function(){
		
		 ($("#testMain").css('display','none').show()),
		 ($("#testQNA").css('display','block')),
		  ($("#testQNA").ready(goNext(index)))
	  });


	  function modalClose(){
		    $(".popup-wrap").hide();
		  }
	  $(".closeArea").click(function(){
		  modalClose();
	  });
		function addAnswer(answerText, num){
		$(".answerBox").append('<button type="button" class="answerList" value='+num+'>'+answerText+'</button>')
		}
		
		function goNext(index){
			console.log(index);
			
			if(index===endpoint){
						console.log(select);
						console.log(resultword);
						console.log("결과라인"+index);
						return goResult();						
					}else{
					$(".qBox").html(qnaList[index].q);
					for(let j in qnaList[index].a){
						addAnswer(qnaList[index].a[j].answer,j)
					}
					$('.answerList').on('click',function(){
						select[index]=$(this).val();
						//$('.answerList').disabled=true;
						//$('.answerList').css('display','none');
						$('.answerList').remove();
						goNext(index+1);
					});
				}
			}
			
			function setResult(){
				let answer=0;
				let point = resultword;
				console.log("point"+point);
				$('.resultName').text(infoList[point].name);
				$('#resultImg').append('<img src= "./img/test/image-'+point+'.png" class="resultImg">')
				$('.resultDesc').text(infoList[point].desc);
				$('.resultDesc2').text(infoList[point].desc2);
				$('.searchLink').on('click',function(){
					console.log(infoList[point].name + "운비");
					location.href="MainSearchClass.jsp?type="+infoList[point].name})
				console.log(infoList[point].name)
			}
			
			function goResult(){
				$("#testQNA").css('display','none').show();
				 $("#testResult").css('display','block');
			calResult();
			setResult();
			}
			
			function calResult(){
				let pointArray=[
					{name:'참여형', value:0,key:0},
					{name:'향유형', value:0,key:1},
					{name:'수강형', value:0,key:2}
				]
			
				for(let i =0; i<endpoint;i++){
					let target = qnaList[i].a[select[i]];
							for(let k=0;k<pointArray.length;k++){
								if(target.type1[0]==pointArray[k].name){
									pointArray[k].value+=1
								
							}
							
						}
				}
				let resultArray = pointArray.sort(function(a,b){
					if(a.value>b.value){
						return-1;
					}
					if(a.value<b.value){
						return 1;
					}
					return 0;
				});
				console.log(resultArray);//
				resultword = resultArray[0].key;
				return resultword;
				
			}
	