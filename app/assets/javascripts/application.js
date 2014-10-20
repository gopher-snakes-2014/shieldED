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

bindEvents = (function() {
  $(".search-form").on('ajax:success', function(e, data){
    $.each(data, function (obj, val){
      $(".report ul").append('<div> <li>' + val.date + '</li>   ' + val.details + ' </div><br>')
    });
    $(".admin-search").hide(400);
    console.log(data)
    $(".report").show(400);
  });
  $(".search-form").on('ajax:error', function(e, data) {console.log(data)});
});

$( document ).ready(function() {
   bindEvents();
  $(".report").hide();
});


