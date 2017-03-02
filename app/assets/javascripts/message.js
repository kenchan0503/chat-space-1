$(document).on('turbolinks:load', function() {
  function buildHTML(message) {
    //データを受け取って、ulの中身を作って返す。
    var liTag = '<li class = "message__contents">'
    var nicknameTag = '<p class = "message__contents__sender" >'  + message.nickname
    var timeTag = '<p class = "message__contents__time" >'    + message.created_at
    if (message.image) {
    var bodyTag = '<p class = "message__contents__content" >' + '<img src=' + message.image + '>';
    } else {
    var bodyTag = '<p class = "message__contents__content" >' + message.body;
    }
    var html = liTag + nicknameTag + timeTag + bodyTag;
    return html;
  }

  function scroll_chatview(){
    //画面を一番下までスクロールする。
    $('.right-content__middle').animate({scrollTop: $('.right-content__middle')[0].scrollHeight}, 'fast');
  }

    //自動更新の処理
  var uploadTime = 5000; //5秒ごとに更新
  setInterval(automaticUpdating, uploadTime);

  function automaticUpdating() {
    var current_url = document.location.pathname;
    if (current_url.match(/messages/)) {
      $.ajax({
        type: 'GET',
        url: current_url,
        dataType: 'json'
      })
      .done(function(data) {
        var current_message_number = $('.message__contents').length;
        if (current_message_number != data.messages.length) {
          for (var i = current_message_number; i < data.messages.length; i++) {
            var html = buildHTML(data.messages[i]);
            $('ul.message').append(html);
            scroll_chatview();
          }
        }
      })
      .fail(function() {
        console.log('error');
      });
    }
  };

  //メッセージが送信された時の処理
  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var textField     = $('.text');
    var fileField     = $('.set_image');
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
      fileField.val('');
      scroll_chatview();
    })
    .fail(function() {
      alert('error');
    });
    return false
  });
});
