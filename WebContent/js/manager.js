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
let cateType = '${category }';
const $selectTitle = $(".select_title");
const $articleSection = $("#articleSection");
const $btnClose = $(".btn_close");
const $innerSearch = $(".inner_search");
const $innerBar = $('.inner_bar');
const $icoSearchBar = $('.ico_search_bar');
const $icoBtnDetail = $('.ico_btn_detail');
const $innerDetailSearch = $('.inner_detail_search');
const $deleteBtn = $('.btn_delete');
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

console.log(cateType);

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

function contents() {
	alert("contents!");
}

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
