App.BoardController = Ember.ObjectController.extend

  selectedItems: []

  createCard: (top, left) ->
    item = @store.createRecord 'item',
      kind: 'card'
      board: @get('model')
      top: top
      left: left
    item.save()

  destroySelected: -> @get('selectedItems').forEach (item) => item.destroyRecord()
