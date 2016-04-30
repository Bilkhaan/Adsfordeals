$(document).ready(function() {
  if($('#normal-view').length > 0) {
    $('body').addClass('bg-black');
  }

  if($('#circuler-spin').length > 0) {
    $("#circuler-spin").rotator({
      starting: 0,
      ending: 100,
      percentage: true,
      color: 'black',
      lineWidth: 7,
      timer: 100,
      radius: 40,
      fontStyle: 'Calibri',
      fontSize: '18pt',
      fontColor: 'black',
      backgroundColor: 'lightgray',
      callback: function () {
        add_coins_to_user();
      }
    });
  }
});

var add_coins_to_user = function() {
  var content_item_id = $('#circuler-spin').data('content');
  $.ajax({
    url: '/content_items/'+content_item_id+'/completed_ad',
    type: 'post',
    dataType: 'json',
    success: function(data) {
      on_ad_success(data);
    }
  });
};

var on_ad_success = function(data) {
  if(data['user'] && data['success'] == true) {
    var btn = $('<button/>', {
      text: 'Close this Ad',
      class: 'btn btn-primary close_ad',
      click: function () {
        window.close();
      }
    });
    $('#circuler-spin').html(btn);
    $('#user-coins').text(data['user'].coins);
  } else {
    $('#circuler-spin').html('Sorry, there was some error. Can you please try again.');
  }
}
