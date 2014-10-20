bindEvents = (function() {
  $(".search-form").on('ajax:success', function(e, data){
    $.each(data, function (obj, val){
      $(".report ul").append('<div><li><a href>' +val.id+': ' + val.date + '</li>' + val.details + '</div></a><br>')
    });
    $(".admin-search").hide(400);
    console.log(data)
    $(".report").show(400);
  });
  $(".search-form").on('ajax:error', function(e, data) {console.log(data)});
});

bindLinkToEvent = (function() {
  $(".show-event").on('ajax:success', function(e, data){
    console.log(data);
    $(".admin-search").hide(400);
    $(".report").hide(400);
    $(".").show(400);
  });
  $(".search-form").on('ajax:error', function(e, data) {console.log(data)});
});

$( document ).ready(function() {
   bindEvents();
  $(".report").hide();
   bindLinkToEvent();
});
