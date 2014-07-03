App.BoardController = Ember.ObjectController.extend

  createCard: (top, left) ->
    item = @store.createRecord 'item',
      kind: 'card'
      board: @get('model')
      y_position: top
      x_position: left
    item.save()
