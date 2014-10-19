// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation();
 });

var getReports = function(searchData) {
  console.log("getting")
  console.log(searchData)
  $.ajax({
    url: '/admins/dashboard/search',
    type: 'get',
    data: searchData
  }).done(function(data) {
    console.log("success" + data);
  }).fail(function() {
     console.log("fail");
  });
},

bindEvents = (function() {
  console.log("in bind events")
  $(".search-form").on('submit',function(){
    event.preventDefault();
    getReports($('.search-form').serialize());
    $("admin-search").hide(400);
    $("report").show(500);
  });

  // $("#close").click(function(){
  //   event.preventDefault();
  //   $("report").hide(500);
  //   $("admin-search").show(400);
  // });
});

$( document ).ready(function() {
  console.log("events bound")
  bindEvents();
});


