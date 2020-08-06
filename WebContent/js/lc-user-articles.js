/**
 * userPage.jsp
 * 유저가 쓴 글, 댓글 확인 
 */

    const $tab = $(".inp_tab"); //탭 
    const $checkedAllBtn = $(".btn_checked_all");//전체 선택 버튼 
 // 템플릿 

    const postsTmp = _.template($("#postsTmp").html());
    const commentsTmp = _.template($("#commentsTmp").html());
    
    
    const $postList = $("#postingList ul");
    const $commentList = $("#commentList ul");
    let checkedTabValue = $("input[name=tab]:checked").val();//체크된 article
    
    
    
    //let checkedTabValue = "";
getCheckedTab(checkedTabValue);

    $checkedAllBtn.on("click",function(){ //전체 선택 버튼 클릭 
        const $list = $($(this).parent().siblings());
        const inp = $list.find('input');
        //console.log(inp.prop("checked"));
        if(inp.prop("checked")){
            //console.log(inp)
             inp.prop("checked",false);
        }else{
            inp.prop("checked",true);
        }
    });
    
    

    $tab.on("click",function(){ //탭 버튼 클릭 
       checkedTabValue = $("input[name=tab]:checked").val();
       getCheckedTab(checkedTabValue);
       
      
        
    });
    
    
    
    
    function getArticles(checkedTabValue) {
	
    	$.ajax({
    		url:"/ajax/explorer/${explorer.no}/"+checkedTabValue,
    		dataType:"json",
    		type:"post",
    		error:function(){
    			alert("상태 점검 중");
    		},
    		success:function(json){
    			if(checkedTabValue=="posting"){
    			$postList.empty().append(postsTmp({"posts":json}));
    			}else{
    				$commentList.empty().append(commentsTmp({"comments":json}));
    			}
    		}//success
			
			
		});
	}

	function getCheckedTab(checkedTabValue) { // 선택된 탭의 article 갖고 오기 
		const $checkedTab = $("."+checkedTabValue);
	    const $otherTab = $(".article");
	        //console.log(checkedTabValue);
	        
	        if(!$checkedTab.hasClass('on')){
	            $otherTab.removeClass('on');
	        
	        }

	        $checkedTab.addClass('on');
	        console.log(checkedTabValue);
	        getArticles(checkedTabValue);
	        
	        
	}