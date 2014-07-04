#= require ../mixins/item_creator
App.BoardController = Ember.ObjectController.extend App.ItemCreatorMixin,

  selectedItems: []

  clearSelected: -> @set 'selectedItems', []

  destroySelected: ->
    @get('selectedItems').forEach (item) => item.destroyRecord()
    @clearSelected()

  isEditing: ( ->
    return true if @get('items').findBy('isEditing')
    return false
  ).property('items.@each.isEditing')
