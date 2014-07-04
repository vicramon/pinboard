App.BoardController = Ember.ObjectController.extend

  selectedItems: []

  createItem: (kind, top, left) ->
    return @createImage(top, left) if kind is 'image'
    @createCardOrText(kind, top, left)

  createCardOrText: (kind, top, left) ->
    item = @store.createRecord 'item',
      kind: kind
      board: @get('model')
      top:  top  - App.Item.startingOffset[kind]['top']
      left: left - App.Item.startingOffset[kind]['left']
    item.save()
    @startEditing(item)

  createImage: (top, left) ->
    filepicker.pickAndStore
      mimetype: 'image/*'
      services: ['computer', 'dropbox', 'evernote', 'facebook', 'flickr', 'gmail', 'instagram', 'webcam']
    ,
      location: 'S3'
      access: 'public'
    ,
      (InkBlobs) =>
        url = InkBlobs[0].url
        item = @store.createRecord 'item',
          kind: 'image'
          board: @get('model')
          top: top
          left: left
          url: url
        item.save()

  startEditing: (item) ->
    item.set 'isEditing', true
    @get('selectedItems').addObject item
    Em.run.scheduleOnce 'afterRender', @, ( -> item.trigger('focusMe') )

  clearSelected: -> @set 'selectedItems', []

  destroySelected: ->
    @get('selectedItems').forEach (item) => item.destroyRecord()
    @clearSelected()

  isEditing: ( ->
    return true if @get('items').findBy('isEditing')
    return false
  ).property('items.@each.isEditing')
