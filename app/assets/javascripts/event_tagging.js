var TagsModel = function(eventID) {
  this.receivedTags = "PLACEHOLDER new tags updated from the server"
  this.receivedUnTags = "PLACEHOLDER confirmed untags from the server"
  this.sendTags = []
  this.sendUnTags = []
  this.eventID = eventID
}

TagsModel.prototype = {

  addTags: function() {
    return $.ajax({
              url: '/events/'+this.eventID+'/event_tags/create',
              type: 'POST',
              data: {tags: this.sendTags},
            })
            .done(function(data) {
              this.receivedTags = data
            }.bind(this))
            .fail(function() {
              console.log("tag addTags fail");
            })
  },

  removeTags: function() {
    return $.ajax({
              url: '/events/'+this.eventID+'/event_tags/untag',
              type: 'DELETE',
              data: {untags: this.sendUnTags},
            })
            .done(function(data) {
              this.receivedUnTags = data
            }.bind(this))
            .fail(function() {
              console.log("tag removeTags fail");
            })
  },

  collectSelected: function() {
    this.sendTags = []
    $('.selected_tag').each(function(index, el) {
      this.sendTags.push(el.id)
    }.bind(this));
    return this.sendTags
  },

  collectUnSelected: function() {
    this.sendUnTags = []
    $('.unselected_tag').each(function(index, el) {
      this.sendUnTags.push(el.id)
    }.bind(this));
    return this.sendUnTags
  },

}

var TagsView = function(eventTagsContainer,availableTagsContainer) {
  this.container = eventTagsContainer
  this.eventID = eventTagsContainer[0].id
  this.availableTags = availableTagsContainer
  this.button = $('button')
}

TagsView.prototype = {
  renderNewTags: function(newTags) {
    this.container.empty()
    this.container.append(newTags)
  },

  renderUnTags: function(unTags) {
    this.availableTags.empty()
    this.availableTags.append(unTags)
  },

  clearUsedTags: function() {
    this.availableTags.find('.selected_tag').remove()
  },

  clearUnTags: function() {
    this.container.find('.unselected_tag').remove()
  },

  toggleTags: function(id){
    $('#'+id).toggleClass('selected_tag')
  },

  toggleUnTags: function(id){
    $('#'+id).toggleClass('unselected_tag')
  },

}

var TagsController = function(model,view) {
  this.model = model
  this.view = view
}

TagsController.prototype = {

  bindEvents: function() {
    this.view.availableTags.on('click', this.toggleSelection.bind(this))
    this.view.container.on('click', this.toggleUnSelection.bind(this))
    this.view.button.on('click', this.replaceTags.bind(this))
  },

  replaceTags: function() {
    var that = this
    if (this.model.collectSelected().length > 0) {
      $.when(this.model.addTags())
          .then(function() {
            var receivedTags = that.model.receivedTags
            that.view.renderNewTags(receivedTags);
            that.view.clearUsedTags();
            }
          );
    }
    if (this.model.collectUnSelected().length > 0) {
      $.when(this.model.removeTags())
          .then(function() {
            var receivedUnTags = that.model.receivedUnTags
            that.view.renderUnTags(receivedUnTags);
            that.view.clearUnTags();
            }
          );
    }
  },

  toggleSelection: function(clickEvent){
    var tagId = clickEvent.target.id
    this.view.toggleTags(tagId)
  },

  toggleUnSelection: function(clickEvent){
    var tagId = clickEvent.target.id
    this.view.toggleUnTags(tagId)
  },

}

function activateEventTagging(){
  var view = new TagsView($('.event_tags_container'),$('.available_tags_container'))
  var model = new TagsModel(view.eventID)
  var controller = new TagsController(model,view)
  controller.bindEvents()
}
