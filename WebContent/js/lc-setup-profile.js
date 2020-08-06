/**
 * set up a profile 
 * userPage
 */

const $profileSettingBtn = $(".btn_profile_setting");
    const $nicknameInp = $("#nicknameInp");
    const $popupCloseBtn = $(".btn_close");
    const $bgPopup = $(".popup_bg");
    
    $profileSettingBtn.on("click",openPopup);
     $popupCloseBtn.on("click",closePopup);
    function openPopup(){
        if(!$bgPopup.hasClass("open")){
            $bgPopup.addClass("open");
        }
        
    }
    function closePopup(){
         if($bgPopup.hasClass("open")){
            $bgPopup.removeClass("open");
        }
    }