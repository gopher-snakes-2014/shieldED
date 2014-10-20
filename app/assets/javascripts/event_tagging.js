// CR make a Tag widget / MVC structure - you will need that to test with Jasmine

$('.all_tags').on('click', function(event) {
  var tagId = event.target.id
  $('#'+tagId).toggleClass('selected_tag')
});

tagArray = [];

$('button').on('click', function(event) {
  var eventID = $('.event_tags_container')[0].id
  console.log("adding new tags for event (id:"+eventID+") now...");

  $('.selected_tag').each(function(index, el) {
    tagArray.push(el.id)
  });

// CR Add data- attributes so this url be created from the
  $.ajax({
    url: '/events/'+eventID+'/event_tags/create',
    type: 'POST',
    data: {tags: tagArray},
  })
  .done(function(data) {
    // CR call a view
    $('.event_tags_container').empty()
    $('.event_tags_container').append(data)
    $('.all_tags').find('.selected_tag').remove()
    console.log("success");
  })
  .fail(function() {
    console.log("error");
  })
  .always(function() {
    console.log("complete");
  });
});

