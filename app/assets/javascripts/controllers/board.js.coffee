#= require ../mixins/item_creator
App.BoardController = Ember.ObjectController.extend App.ItemCreatorMixin,

  selectedItems: []

  clearSelected: -> @set 'selectedItems', []

  destroySelected: ->
    @get('selectedItems').forEach (item) => item.destroyRecord()
    @clearSelected()

  isEditing: ( ->
    if @get('items').findBy('isEditing') then true else false
  ).property('items.@each.isEditing')
