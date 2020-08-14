/**
 * 
 */

const $wrapList = $(".list_member");
const $txtInp = $(".inp_txt");
const $searchForm = $("#searchForm");
const $totalCount = $(".total_count");
const $aux = $(".aux");
const $sortBtn = $(".sort input[type=radio]");
const $divPaginate = $('.div_paginate');
let page = 1;// page는 1페이지 부터 시작  
let cateType = $('#categoryINP').val(); 
const $selectTitle = $(".select_title");
const $articleSection = $("#articleSection"); 
const $btnClose = $(".btn_close");
const $innerSearch = $(".inner_search");
const $innerBar = $('.inner_bar');
const $icoSearchBar = $('.ico_search_bar');
const $icoBtnDetail = $('.ico_btn_detail');
const $innerDetailSearch = $('.inner_detail_search');
const $deleteBtn = $('.btn_delete');
const $tabInp = $('.tab input[type=radio]');
const $contentsDIV = $('.div_contents');
const $detailSearchBox = $('.box_inp_detail_search');
let oldValue = null;
let oldStockCode = null;
const $companySearchBox = $("#companySearchBox");
//reset 조건 
const $resetTabType = $("input:radio[name=tab]:input[value='finance']");
const $resetSortingType = $("input:radio[name=sortType]:input[value='latest']");
function reset() {
	page = 1;
	$resetTabType.prop('checked',true);
	$resetSortingType.prop('checked',true);
	$txtInp.val("");
	
}
reset();

$txtInp.keyup(findCompany)
.blur(findCompany)
.focus();


function findCompany() {
	$companySearchBox.show();
	let inpValue = $(".company_inp").val();
	console.log(inpValue);
	if(inpValue!="" && oldValue!=inpValue ){
		oldValue = inpValue;
	console.log(inpValue);
	$.ajax({
		url : "/vanilla-stock/ajax/manager/contents/finance/search/company/"+inpValue,
		 dataType:"json",
		type : "post",
		error : function() {
			alert("error");
		},
		success : function(data) {
			console.log(data);
			let tmp = searchCompanyTmp({
				"companyList" : data
			});
			
			$companySearchBox.empty().append(tmp);
		}//success end 

	});//ajax end 
	}//if end 
}//findCompany end 

$companySearchBox.on('click','li', function() {
	//alert("test");//test by kimdabin
	let stockCode = $(this).attr('data-stockCode');
	let companyResult = $(this).text();
	$txtInp.val(companyResult);
	console.log(stockCode);
	
	if(stockCode!="" && oldStockCode!=stockCode ){
		oldStockCode = stockCode;
	
	$.ajax({
		url : "/vanilla-stock/ajax/manager/contents/finance/search/term/"+stockCode,
		 dataType:"json",
		type : "post",
		error : function() {
			alert("error");
		},
		success : function(data) {
			console.log(data);
			let years = new Set();
			let quarters = new Array();
			data.forEach(function(el, index) {
				years[index] = el.year;
				quarters[index] = el.quarter;
				console.log("year");
				console.log(el.year);
			});
			let termTmp = searchTermTmp({
				"years" : years,
				"quarters": quarters
			});
//			
			$detailSearchBox.empty().append(termTmp);
		}//success end 

	});//ajax end 
	}//if end 
});
$("html").click(function(e){
	if(!$(e.target).hasClass("company_search_on")){
		$companySearchBox.hide();
	}//if end
});//
$deleteBtn.on('click', function() {
	//console.log($(this).parent().prevAll('input[type=checkbox]'));
	let no = $(this).prevAll('input[type=checkbox]').val();

});

$icoBtnDetail.on('click', function() {
	$innerSearch.toggleClass('hidden');
	$innerDetailSearch.toggleClass('hidden');

});

$selectTitle.on("click", function() {
	$articleSection.toggleClass("click");
});//on end

$btnClose.on("click", function() {
	$innerSearch.addClass('hidden');
	$innerBar.removeClass('hidden');
});

$icoSearchBar.on('click', function() {
	$innerSearch.removeClass('hidden');
	$innerBar.addClass('hidden');
});

$btnClose.on("click", function() {
	$innerSearch.addClass('hidden');
	$innerBar.removeClass('hidden');
});

$icoSearchBar.on('click', function() {
	$innerSearch.removeClass('hidden');
	$innerBar.addClass('hidden');
});

$selectTitle.on("click", function() {
	$articleSection.toggleClass("click");
});//on end

//console.log(cateType);

window[cateType]();
//getMembers();

$sortBtn.change(window[cateType]);
//검색하기 
$searchForm.submit(function(e) {
	e.preventDefault();
	//console.log(sortingType);
	page = 1;
	//getMembers();
	window[cateType]();

});//submit end 
$tabInp.change(contentsTab);



function contents() {
	//alert("contents!");
	let formData = $searchForm.serialize();
	console.log("form data");
	console.log(formData);
}
function contentsTab() {
	//reset();
	var nowTab = $('.inp_tab:checked').val();
	alert(nowTab);
	if($contentsDIV.hasClass('show')){
		$contentsDIV.removeClass('show');
	}
	$('div .'+nowTab).addClass('show');
}//contentsTab
function members() {

	let formData = $searchForm.serialize();
	console.log("form data");
	console.log(formData);
	$.ajax({
		url : "/vanilla-stock/ajax/manager/members",
		type : "post",
		data : formData + '&page=' + page,
		error : function() {
			alert("error");
		},
		success : function(json) {

			if (page == 1 || json.memberList.length > 0) {

				let tmp = membersTmp({
					"memberList" : json.memberList,
					"paginate" : json.paginate
				});
				console.log(json.total);
				$totalCount.text(json.total);

				$wrapList.empty().append(tmp);
				$divPaginate.empty().append(json.paginate);
				$txtInp.val("");

			}
		}

	});//ajax end 
}// search() end

//pageblock 클릭
$aux.on("click", ".paginate a", function(e) {
	e.preventDefault();
	// 각 페이지의 시작되는 게시물 번호  
	page = this.dataset.no;
	//ajax로 데이터 리스트 받아오는 함수 
	console.log(page)
	window[cateType]();
	//getMembers();

});//click() end
