var TagsModel = function(eventID) {
  this.receivedTags = "new tags updated from the server"
  this.sendTags = []
  this.eventID = eventID
}

TagsModel.prototype = {

  fetch: function() {
    var self = this
    return $.ajax({
        url: '/events/'+this.eventID+'/event_tags/create',
        type: 'POST',
        data: {tags: this.sendTags},
      })
      .done(function(data) {
        console.log("here's receivedTags BEFORE being updated: "+self.receivedTags);
        self.receivedTags = data
        console.log("here's receivedTags AFTER being updated: "+self.receivedTags);
        console.log("success");
      })
      .fail(function() {
        console.log("error");
      })
      .always(function() {
        console.log("complete");
      });
  },

  collectSelected: function() {
    var that = this
    $('.selected_tag').each(function(index, el) {
      that.sendTags.push(el.id)
    });
  }

}

var TagsView = function(container,availableTags) {
  this.container = container
  this.eventID = container[0].id
  this.availableTags = availableTags
}

TagsView.prototype = {
  renderNewTags: function(newTags) {
    console.log("Appending new tags..."+newTags);
    this.container.empty()
    this.container.append(newTags)
  },

  clearUsedTags: function() {
    this.availableTags.find('.selected_tag').remove()
  },

  buttonClickMessage: function() {
    console.log("button got clicked!");
    console.log("adding new tags for event (id:"+this.eventID+") now...");
  }
}

var TagsController = function(model,view) {
  this.model = model
  this.view = view
}

TagsController.prototype = {

  bindEvents: function() {
    this.activateAvailableTags()
    this.activateConfirmButton()
  },

  replaceTags: function() {
    this.model.collectSelected()
    var that = this
    $.when(this.model.fetch())
      .then(function() {
        var receivedTags = that.model.receivedTags
        console.log("Here are the tags I received: "+that.model.receivedTags);
        that.view.renderNewTags(receivedTags);
        that.view.clearUsedTags();
        }
      );
  },

  activateAvailableTags: function() {
    this.view.availableTags.on('click', function(event) {
      var tagId = event.target.id
      $('#'+tagId).toggleClass('selected_tag')
    });
  },

  activateConfirmButton: function() {
    var that = this
    $('button').on('click', function(event) {
      that.view.buttonClickMessage()
      that.replaceTags()
    });
  }

}

var view = new TagsView($('.event_tags_container'),$('.all_tags'))
var model = new TagsModel(view.eventID)
var controller = new TagsController(model,view)

controller.bindEvents()
