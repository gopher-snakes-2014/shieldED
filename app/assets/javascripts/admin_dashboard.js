bindEvents = (function() {
  $(".search-form").on('ajax:success', function(e, data){
    $.each(data, function (obj, val){
      // CR use templates
      $(".report ul").append('<div><li><a href>' +val.id+': ' + val.date + '</li>' + val.details + '</div></a><br>')
      // CR no BR tags - yuk!!
    });
    $(".admin-search").hide(400);
    // CR BUGBUG
    console.log(data)
    $(".report").show(400);
  });
  $(".search-form").on('ajax:error', function(e, data) {console.log(data)});
});

bindLinkToEvent = (function() {
  $(".show-event").on('ajax:success', function(e, data){
    console.log(data);
    // CR create a view object and call update
    $(".admin-search").hide(400);
    $(".report").hide(400);
    $(".").show(400);
  });
  $(".search-form").on('ajax:error', function(e, data) {console.log(data)});
});

$( document ).ready(function() {
  // CR at a minimum - create an Admin class (using object literal, )
   bindEvents();
  $(".report").hide();
   bindLinkToEvent();
});
