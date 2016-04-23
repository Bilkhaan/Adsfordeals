$(document).ready(function() {
  if($('#normal-view').length > 0) {
    $('body').addClass('bg-black');
  }

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
      window.top.close();
    }
  });
});
