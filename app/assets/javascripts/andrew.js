$(document).ready(function() {
console.log("whatever")
  $(".Login_Link").on("click", function(e) {
    var that = $(this)
    e.preventDefault();
    $.ajax({
      url: '/sessions/login',
      type: 'GET',
      data: that.serialize()
    }).done(function(server_data) {
      console.log("SUCCESS")
      $(".placeholder").html(server_data)
    }).fail(function() {
      console.log("FAIL")
    })
  });

  $(".report-event").on("click", function(e) {
    var that = $(this)
    e.preventDefault();
    $.ajax({
      url: '/events/new',
      type: 'GET',
      data: that.serialize()
    }).done(function(server_data) {
      console.log("SUCCESS")
      $(".dashboard_placeholder").html(server_data)
    }).fail(function() {
      console.log("FAIL")
    })
  });

  $(document).on("ajax:success", '.new_event', function(e, data) {
    console.log("SUCCESS")
    $(".dashboard_placeholder").html(data)
  }).on("ajax:error", function(e, xhr, status, error) {
    console.log("FAIL")
  })

  // $(document).on("ajax:success", '.student-parent-login-form', function(e, data) {
  //   console.log("SUCCESS")
  //   console.log(data)
  //   $(".placeholder").html(data)
  // }).on("ajax:error", function(e, xhr, status, error) {
  //   console.log("FAIL")
  // })
});
