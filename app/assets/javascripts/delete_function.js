// $(document).on('turbolinks:load', function() {
//   var delbtns = $('#delete')
//   delbtns.each(function(delbtn){
//     delbtn.on('dblclick',function(){
//       var link = $(this).attr('data-link')
//       var result = window.confirm('本当に削除しますか？/n関連するデータも削除されます')
//       if( result ) { request.open('DELETE', link); }
//     });
//   })
// });

$(document).on("dblclick", "#delete", function () {
  var link = $(this).attr('data-link');
  $(this).text("もう一度クリックすると削除されます");
  $(this).attr({'href': link, 'data-method': 'delete'});
});
