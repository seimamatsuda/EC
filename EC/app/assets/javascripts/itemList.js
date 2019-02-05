$(function() {
  var page = 0;
  function draw() {
  	var lastPage = Math.ceil(($('.button1').length - 1) / 12);
    lastPage = lastPage == 0 ? 1 : lastPage;
    
  	$('body,html').animate({scrollTop: 0}, 0);
    $('#page').html(page + 1 + " / " + lastPage);
    $('.button1').hide();
    $('.item_list:first,.button1:gt(' + page * 12 + '):lt(12)').show();
  }
  $('#prev').click(function() {
    if (page > 0) {
      page--;
      draw();
    }
  });
  $('#next').click(function() {
    if (page < ($('.button1').length - 1) / 12 - 1) {
      page++;
      draw();
    }
  });
  draw();
});