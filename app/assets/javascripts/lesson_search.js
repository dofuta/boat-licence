$(document).on('turbolinks:load', function() {
  // リスト表示する親要素
  var search_list = $('.LessonSearch__List');

  // 各ユーザー表示のhtml作成の関数
  function appendLesson(lesson){
    var remark  = (lesson.remark) ? lesson.remark : "";
    var teachers = (lesson.teachers) ? lesson.teachers : "";
    var html = `<a class="Lesson" data-lesson-id="${lesson.id}">
                  <div class="Lesson__Group1">
                    <div class="Lesson__Group1Type">
                      <label>種類</label>
                      ${lesson.type}
                    </div>
                    <div class="Lesson__Group1Date">
                      <label>講習日</label>
                      ${lesson.date}
                    </div>
                  </div>
                  <div class="Lesson__Group2">
                    <div class="Lesson__Group2Place">
                      <label>会場名</label>
                      ${lesson.place}
                    </div>
                    <div class="Lesson__Group2GGEvent">
                      <label>Googleカレンダー</label>
                      ${lesson.gg_event}
                    </div>
                  </div>
                  <div class="Lesson__Group3">
                    <div class="Lesson__Group3Teacher">
                      <label>講師</label>
                      ${teachers}
                    </div>
                    <div class="Lesson__Group3Remark">
                      <label>備考</label>
                      ${remark}
                    </div>
                  </div>
                </a>`
    search_list.append(html)
  }
  // 一致するユーザーがいなかった時のhtml
  function appendNoLesson(){
    var html = `<div class="Lesson">
                  <p>一致する講習は存在しません</p>
                </div>`
    search_list.append(html);
  }


  // 検索窓に文字が打ち込まれた時
  $('.LessonSearch__Group1Submit input').on('click',function(e){
    // デフォルトの送信を止める
    e.preventDefault();
    // インプットされたユーザー検索文字列
    var type_number = $('select#type_number option:selected').val();
    var date = $('input#date').val();
    // 検索窓が空白でなければ
    if (type_number.length !== 0 || date.length !== 0){
      // ajaxを実行
      $.ajax({
        type: 'GET',
        url: location.pathname,
        data: { type_number: type_number ,date: date },
        dataType: 'json'
      })
      // 成功した時
      .done(function(data){
        search_list.empty();
        var lessons = data["lessons"]
        var user_id = data["user_id"]
        // lessonsに値があれば
        if (lessons.length !== 0) {
          // 各lessonのhtmlを作成、挿入する
          lessons.forEach(function(lesson){
            appendLesson(lesson);
          });
          // 事前にdata属性に入れておいたlesson_idを取得する
          var lesson_id = $('a.Lesson').attr('data-lesson-id')
          // 各レッスンにuser_id,lesson_id入りのurlを挿入する
          $('a.Lesson').attr('href', `/users/${user_id}/lessons/${lesson_id}/user_owned_lessons/new`)
        }
        else {
          appendNoLesson();
        }
      })
      // 失敗した時
      .fail(function(data){
        alert("通信に失敗しました")
      })
    }
    else {
      search_list.empty(); //検索窓が空白の場合は検索リストを空にする
      appendNoLesson();
    }
  });
});
