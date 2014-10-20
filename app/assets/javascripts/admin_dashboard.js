bindEvents = (function() {
  $(".search-form").on('ajax:success', function(e, data){
    $.each(data, function (obj, val){
      $(".report ul").append('<li>' + val.date + '</li>')
    });
    $(".admin-search").hide(400);
    $(".report").show(500);
  });
  $(".search-form").on('ajax:error', function(e, data) {console.log(data)});
});

$( document ).ready(function() {
   bindEvents();
  $(".report").hide();
});
