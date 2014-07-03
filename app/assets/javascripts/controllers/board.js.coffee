App.BoardController = Ember.ObjectController.extend

  selectedItems: []

  createItem: (kind, top, left) ->
    if kind is 'card'
      top = top - 35
      left = left - 85
    item = @store.createRecord 'item',
      kind: kind
      board: @get('model')
      top: top
      left: left
    item.save()

  clearSelected: -> @set 'selectedItems', []

  destroySelected: ->
    @get('selectedItems').forEach (item) => item.destroyRecord()
    @clearSelected()

  isEditing: ( ->
    return true if @get('items').findBy('isEditing')
    return false
  ).property('items.@each.isEditing')
