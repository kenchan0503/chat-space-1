$(function() {
  function buildHTML(message) {
    //データを受け取って、ulの中身を作って返す。
    var html = '<li class = "message__contents">'
    + '<p class = "message__contents__sender" >' + message.nickname
    + '<p class = "message__contents__time" >' + message.created_at + " +0900"
    + '<p class = "message__contents__content" >' + message.body;
    console.log(html) //実装完了時に消します。
    return html;
  }

  $('#new_message').on('submit', function(e) {
    console.log("ちゃんと動いている") //実装完了時に消します。
    e.preventDefault();
    var textField = $('.text');
    var content_input = textField.val();
    var request_url = $("#new_message").attr("action");

    $.ajax({
      type: 'POST',
      url: request_url,
      data: {
        message: {
          body: content_input
        }
      },
      dataType: 'json',
    })
    .done(function(data) {
    console.log(data);
      var html = buildHTML(data);
      $('ul.message').append(html);
      $('.right-content__middle').animate({scrollTop: $('.right-content__middle')[0].scrollHeight}, 'fast'); //一番下までスクロールさせる。
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
    return false
  });
});
