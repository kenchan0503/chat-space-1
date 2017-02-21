$(document).on('turbolinks:load', function() {
  var preWord = ""

  function appendList(user) {
    var item = '<li class = "chat-group-user clearfix">'
      + '<p class = "chat-group-user__name" >'     + user.nickname
      + '<div class = "chat-group-user__btn", user_id = ' + user.id + ', user_nickname = ' + user.nickname + ' >'
      + '<p class = "chat-group-user__btn--add" >' + "追加";
    $("#user-search-result").append(item);
  }

  //追加ボタンをクリックした時の処理
  // TODO クラス名がchat-group-userのままだとkeyupのたびに消えてしまうのでクラス名を変える
  $(document).on("click", ".chat-group-user__btn--add", function() {
    var item = '<li class = "chat-group-user clearfix">'
    + '<p class = "chat-group-user__name" >' + $(".chat-group-user__btn").attr("user_nickname")
    + '<div class = "chat-group-user__btn", user_id = ' + $(".chat-group-user__btn").attr("user_id") + ' >'
    + '<input type="hidden" name="group[user_ids][]" value=' + $(".chat-group-user__btn").attr("user_id") + '>'
    + '<p class = "chat-group-user__btn--remove" >'          + "削除";
    $("#chat-group-users").append(item);
  });

  function editInput(input){
    var editedInput = "^" + input;
    return editedInput;
  }

  $(function() {
    $("#user-search-field").on("keyup", function() {
      //TODO この部分見直し
      var input          = $("#user-search-field").val();
      var splitedInputs  = input.split(" ").filter(function(e){ return e; });
      var editedInput   = splitedInputs.map(editInput);
      var toSearchInputs = editedInput.join("|");
      var reg            = new RegExp(toSearchInputs);

      if (input.length != 0 && preWord != toSearchInputs) {
        $(".chat-group-user").remove();
        $.each(users, function(i, user) {
          if (user.nickname.match(reg)) {
            appendList(user)
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
