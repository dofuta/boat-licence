$(document).on("ajax:success", "#user-update-form", function(user) {
  // Flashメッセージの表示
  function buildFlash(flashmessage,type){
    // flashmessageを削除
    $('.FlashMessage').empty();
    // flashmessageを作成
      var flashmessage = `<p class='FlashMessage__${type}'>
                            ${flashmessage}
                          <p>`
      // flashmessageを挿入
      $('.FlashMessage').prepend(flashmessage)
  };
  buildFlash("データを更新しました！","notice")
  $('input, textarea').css('background-color', 'white');
  $('.UserInfo__Group3__Info2Submit').remove();
});
$(document).on("ajax:error", "#user-update-form", function(e) {
  // Flashメッセージの表示
  function buildFlash(flashmessage,type){
    // flashmessageを削除
    $('.FlashMessage').empty();
    // flashmessageを作成
      var flashmessage = `<p class='FlashMessage__${type}'>
                            ${flashmessage}
                          <p>`
      // flashmessageを挿入
      $('.FlashMessage').prepend(flashmessage)
  };
  buildFlash("データを更新できませんでした！","alert")
});
