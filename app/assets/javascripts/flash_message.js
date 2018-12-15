$(document).on("ajax:success", function(e) {
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

  if(error = e.detail[0].errors == undefined ) {
    console.log(e)
    buildFlash("データを更新しました！","notice");
  } else {
    console.log(e)
    buildFlash(e.detail[0].errors, "alert");
  };
});
