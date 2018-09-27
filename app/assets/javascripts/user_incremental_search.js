$(document).on('turbolinks:load', function() {
  // リスト表示する親要素
  var search_list = $('.UserSearch__List');

  // 各ユーザー表示のhtml作成の関数
  function appendUser(user){
    var html = `<div class="UserSearch__ListAddedUser">
                  <a class="UserSearch__ListAddedUserLink" href="users/${user.id}">${user.name}  ${user.name_furigana}</a>
                </div>`
    search_list.append(html);
  }
  // 一致するユーザーがいなかった時のhtml
  function appendNoUser(){
    var html = `<div class=".UserSearch__ListAddedUser">
                  <p>一致するユーザーは存在しません</p>
                </div>`
    search_list.append(html);
  }


  // 検索窓に文字が打ち込まれた時
  $('.UserSearch__Field').on('keyup',function(){
    // インプットされたユーザー検索文字列
    var input = $('.UserSearch__Field').val();
    // 検索窓が空白でなければ
    if (input != ""){
      // ajaxを実行
      $.ajax({
        type: 'GET',
        url: '/users/search',
        data: { keyword: input },
        dataType: 'json'
      })
      // 成功した時
      .done(function(users){
        search_list.empty();
        if (users.length !== 0) {
          users.forEach(function(user){
            appendUser(user);
          });
        }
        else {
          appendNoUser();
        }
      })
      // 失敗した時
      .fail(function(data){
        alert("通信に失敗しました")
      })
    }
    else {
      search_list.empty(); //検索窓が空白の場合は検索リストを空にする
    }
  });
});
