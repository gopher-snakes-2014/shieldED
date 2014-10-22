var TagsModel = function(eventID) {
  this.receivedTags = "PLACEHOLDER new tags updated from the server"
  this.sendTags = []
  this.eventID = eventID
}

TagsModel.prototype = {

  fetch: function() {
    return $.ajax({
              url: '/events/'+this.eventID+'/event_tags/create',
              type: 'POST',
              data: {tags: this.sendTags},
            })
            .done(function(data) {
              this.receivedTags = data
            }.bind(this))
            .fail(function() {
              console.log("tag fetch fail");
            })
  },

  collectSelected: function() {
    $('.selected_tag').each(function(index, el) {
      this.sendTags.push(el.id)
    }.bind(this));
  }

}

var TagsView = function(container,availableTags) {
  this.container = container
  this.eventID = container[0].id
  this.availableTags = availableTags
}

TagsView.prototype = {
  renderNewTags: function(newTags) {
    this.container.empty()
    this.container.append(newTags)
  },

  clearUsedTags: function() {
    this.availableTags.find('.selected_tag').remove()
  },

  toggleTags: function(id){
    $('#'+id).toggleClass('selected_tag')
  },

}

var TagsController = function(model,view) {
  this.model = model
  this.view = view
}

TagsController.prototype = {

  bindEvents: function() {
    $('button').on('click', this.replaceTags.bind(this))
    this.view.availableTags.on('click', this.toggleSelection.bind(this))
  },

  replaceTags: function() {
    this.model.collectSelected()
    var that = this
    $.when(this.model.fetch())
      .then(function() {
        var receivedTags = that.model.receivedTags
        that.view.renderNewTags(receivedTags);
        that.view.clearUsedTags();
        }
      );
  },

  toggleSelection: function(clickEvent){
    var tagId = clickEvent.target.id
    this.view.toggleTags(tagId)
  },

}

var view = new TagsView($('.event_tags_container'),$('.all_tags'))
var model = new TagsModel(view.eventID)
var controller = new TagsController(model,view)

controller.bindEvents()
