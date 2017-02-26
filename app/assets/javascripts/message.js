$(document).on('turbolinks:load', function() {
  function buildHTML(message) {
    //データを受け取って、ulの中身を作って返す。
    var html = '<li class = "message__contents">'
    + '<p class = "message__contents__sender" >'  + message.nickname
    + '<p class = "message__contents__time" >'    + message.created_at
    + '<p class = "message__contents__content" >' + message.body
    + '<p class = "message__contents__content" >' + '<img src=' + message.image + '>';
    return html;
  }

  function scroll_chatview(){
    //画面を一番下までスクロールする。
    $('.right-content__middle').animate({scrollTop: $('.right-content__middle')[0].scrollHeight}, 'fast');
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var textField     = $('.text');
    var fd = new FormData($(this).get(0));
    var request_url   = $("#new_message").attr("action");

    $.ajax({
      type: 'POST',
      url: request_url,
      data: fd,
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('ul.message').append(html);
      textField.val('');
      scroll_chatview();
    })
    .fail(function() {
      alert('error');
    });
    return false
  });
});
