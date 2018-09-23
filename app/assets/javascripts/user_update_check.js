$(document).on('turbolinks:load', function() {
  $('#user_email').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_name').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_name_furigana').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_former_name').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_former_name_furigana').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_gender').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  // 生年月日
  $('#user_birth_1i').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_birth_2i').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_birth_3i').on('change',function(){
    $(this).css('background-color', '#fad390');
  });

  $('#user_nationality').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_permanent_address').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_former_permanent_address').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_license_number').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_license_status').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_license_expiration_date_1i').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_license_expiration_date_2i').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_license_expiration_date_3i').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_phone_number').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_phone_number2').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_postal_code').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_address').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_postal_code2').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_address2').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_admin').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_teacher').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('#user_remark').on('change',function(){
    $(this).css('background-color', '#fad390');
  });
  $('input, textarea, select').on('change',function(){
    if ($('.UserInfo__Group3__Info2Submit').length == 0){
      var html = `<div class="UserInfo__Group3__Info2Submit"><input type="submit" name="commit" value="更新する" style="cursor:pointer" data-disable-with="更新する"></div>`
      $('.UserInfo__Group3__Info2').append(html)
    }
  });
});
