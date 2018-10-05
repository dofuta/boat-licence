$(document).on('turbolinks:load', function() {
  // 変更箇所の背景色を変える
  $('.UserInfo input').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('.UserInfo textarea').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('.UserInfo select').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  // 更新ボタンの出現
  $('.UserInfo input, .UserInfo textarea, .UserInfo select').on('change',function(){
    if ($('.UserInfo__Group3__Info2Submit').length == 0){
      var html = `<div class="UserInfo__Group3__Info2Submit"><input type="submit" name="commit" value="更新する" style="cursor:pointer" data-disable-with="更新する"></div>`
      $('.UserInfo__Group3__Info2').append(html)
    }
  });
});
