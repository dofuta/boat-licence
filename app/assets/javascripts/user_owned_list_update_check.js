$(document).on('turbolinks:load', function() {

  // user_owned_exam変更箇所の背景色の変更
  $('.UserOwnedExam textarea, .UserOwnedExam input, .UserOwnedExam select').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  // user_owned_lesson変更箇所の背景色の変更
  $('.UserOwnedLesson textarea, .UserOwnedLesson input, .UserOwnedLesson select').on('change',function(){
    $(this).css('background-color', '#fad390');
  });

  // user_owned_lesson更新ボタンの出現
  $('.UserOwnedList__LessonsList input, .UserOwnedList__LessonsList textarea, .UserOwnedList__LessonsList select').on('change',function(){
    var uolesson_id = $(this).attr('data-id')
    if ($(`form#user_owned_lesson${uolesson_id} .UserOwnedLesson__Submit input`).length === 0){
      var html = `<input type="submit" name="commit" value="更新する" data-disable-with="更新する">`
      $(`.UserOwnedLesson form#user_owned_lesson${uolesson_id} .UserOwnedLesson__Submit`).append(html)
    }
  });
  // user_owned_lesson更新ボタンの出現
  $('.UserOwnedList__ExamsList input, .UserOwnedList__ExamsList textarea, .UserOwnedList__ExamsList select').on('change',function(){
    var uoexam_id = $(this).attr('data-id')
    if ($(`form#user_owned_exam${uoexam_id} .UserOwnedExam__Submit input`).length === 0){
      var html = `<input type="submit" name="commit" value="更新する" data-disable-with="更新する">`
      $(`.UserOwnedExam form#user_owned_exam${uoexam_id} .UserOwnedExam__Submit`).append(html);
    }
  });
});
