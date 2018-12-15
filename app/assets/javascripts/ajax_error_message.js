$(document).on("ajax:error", function(e) {
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
