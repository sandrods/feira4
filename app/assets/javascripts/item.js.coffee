window.show_item_exception = (msg) ->
  $("#fail_sound")[0].play();
  $("#error_msg").html(msg);
  $("#error_modal").modal();
