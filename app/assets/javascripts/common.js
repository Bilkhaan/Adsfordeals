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
      timer: 150,
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

  $('#list').click(function(event){
    event.preventDefault();
    $('#item_tiles .item').addClass('list-group-item');
  });

  $('#grid').click(function(event){
    event.preventDefault();
    $('#item_tiles .item').removeClass('list-group-item');
    $('#item_tiles .item').addClass('grid-group-item');
  });
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
    $('#circuler-spin').addClass('hidden');
    $('.close-ad').removeClass('hidden');
    $('#user-coins').text(data['user'].coins);
  } else {
    $('#circuler-spin').html('Sorry, there was some error. Can you please try again.');
  }
}
