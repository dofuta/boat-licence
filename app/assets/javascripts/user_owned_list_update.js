$(document).on("ajax:success", function(e) {
  // user_owned_exam, user_owned_leson, user_infoのどのformを変更したのかを判断するための変数群
  var exam_id = e.detail[0].exam_id
  var lesson_id = e.detail[0].lesson_id
  var user_owned_lesson_id = e.detail[0].id
  var user_owned_exam_id   = e.detail[0].id
  // json にlesson_idがあった場合（user_owned_lessonの変更）
  if(lesson_id){
    // user_owned_lessonのフィールドを更新したので背景色を白に戻す（）
    $(`form#user_owned_lesson${user_owned_lesson_id} input, form#user_owned_lesson${user_owned_lesson_id}  textarea, form#user_owned_lesson${user_owned_lesson_id}  select`).css('background-color', 'white');
    // 更新ボタンを削除する
    $(`form#user_owned_lesson${user_owned_lesson_id} .UserOwnedLesson__Submit input`).remove();
  }
  // jsonにexam_idがあった場合（user_owned_examの変更）
  else if(exam_id){
    // フィールドを更新したので背景色を白に戻す
    $(`form#user_owned_exam${user_owned_exam_id} input, form#user_owned_exam${user_owned_exam_id}  textarea, form#user_owned_exam${user_owned_exam_id}  select`).css('background-color', 'white');
    // 更新ボタンを削除する
    $(`form#user_owned_exam${user_owned_exam_id} .UserOwnedExam__Submit input`).remove();
  }
  // それ以外（user_infoの変更）
  else{
    // フィールドを更新したので背景色を白に戻す
    $('.UserInfo input, .UserInfo textarea, .UserInfo select').css('background-color', 'white');
    // 更新ボタンを削除する
    $('.UserInfo__Group3__Info2Submit').remove();
  }
});
