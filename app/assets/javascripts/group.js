$(function() {
  var preWord = ""

  //インクリメントサーチの結果を表示する処理
  function appendList(user_id, user_nickname) {
    var item = '<li class = "chat-group-user clearfix", user_id = ' + user_id + ' user_nickname = ' + user_nickname + ' >'
      + '<p class = "chat-group-user__name" >' + user_nickname
      + '<div class = "chat-group-user__btn">'
      + '<p class = "chat-group-user__btn--add" >' + "追加";
    $("#user-search-result").append(item);
  }

  //「追加」ボタンをクリックした時の処理
  $(document).on("click", ".chat-group-user__btn", function() {
    var userId = $(this).parent().attr("user_id");
    var userNickname = $(this).parent().attr("user_nickname");
    var item = '<li class = "chat-group-member clearfix", user_id = ' + userId + ' user_nickname = ' + userNickname + ' >'
    + '<p class = "chat-group-member__name" >' + userNickname
    + '<div class = "chat-group-member__btn">'
    + '<input type="hidden" name="group[user_ids][]" value=' + userId + '>'
    + '<p class = "chat-group-member__btn--remove" >' + "削除";
    $("#chat-group-members").append(item);
    $(this).parent().remove();
  });

    //「削除」ボタンをクリックした時の処理
  $(document).on("click", ".chat-group-member__btn", function() {
    var userId = $(this).parent().attr("user_id");
    var userNickname = $(this).parent().attr("user_nickname");
    appendList(userId, userNickname);
    $(this).parent().remove();
  });

    //既に選択されているメンバーかどうか判別する処理
  function discriminant(user_id){
    elements = document.getElementsByClassName("chat-group-member");
    $.each(elements, function(i, element) {
      existingUserId = element.getAttribute("user_id");
      if (user_id == existingUserId) {
        returnValue = "existing";
        return false;
      } else {
        returnValue = "OK";
      }
    })
    return returnValue;
  }

  $(document).on('turbolinks:load', function() {
    $("#user-search-field").on("keyup", function() {
      var input          = $("#user-search-field").val();
      var splitedInputs  = input.split(" ").filter(function(e){ return e; });
      var toSearchInputs = splitedInputs.join("|");
      var reg            = new RegExp(toSearchInputs);

      if (input.length != 0 && preWord != toSearchInputs) {
        $(".chat-group-user").remove();
        $.each(users, function(i, user) {
          if (user.nickname.match(reg)) {
            if (discriminant(user.id) != "existing") {
              appendList(user.id, user.nickname);
            }
          }
        })
      }
      if (input == "") {
        $(".chat-group-user").remove();
      }
      preWord = toSearchInputs
    });
  });
});
