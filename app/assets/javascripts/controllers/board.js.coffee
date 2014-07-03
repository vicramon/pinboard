App.BoardController = Ember.ObjectController.extend

  selectedItems: []

  createItem: (kind, top, left) ->
    return @createImage(top, left) if kind is 'image'
    if kind is 'card'
      top = top - 35
      left = left - 85
    item = @store.createRecord 'item',
      kind: kind
      board: @get('model')
      top: top
      left: left
    item.save()

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

  clearSelected: -> @set 'selectedItems', []

  destroySelected: ->
    @get('selectedItems').forEach (item) => item.destroyRecord()
    @clearSelected()

  isEditing: ( ->
    return true if @get('items').findBy('isEditing')
    return false
  ).property('items.@each.isEditing')
