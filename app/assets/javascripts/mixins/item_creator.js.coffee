App.ItemCreatorMixin = Ember.Mixin.create

  createItem: (kind, top, left) ->
    if kind is 'image'
      @_createImage(top, left) if kind is 'image'
    else
      @_createCardOrText(kind, top, left)

  _createCardOrText: (kind, top, left) ->
    item = @store.createRecord 'item',
      kind: kind
      board: @get('model')
      top:  top  - @get('_startingOffsets')[kind]['top']
      left: left - @get('_startingOffsets')[kind]['left']
    item.save()
    @_startEditing(item)

  _createImage: (top, left) ->
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
          kind:  'image'
          board: @get('model')
          top:   top  - @get('_startingOffsets')['image']['top']
          left:  left - @get('_startingOffsets')['image']['left']
          url:   url
        item.save()

  _startEditing: (item) ->
    item.set 'isEditing', true
    @get('selectedItems').addObject item
    Em.run.scheduleOnce 'afterRender', @, ( -> item.trigger('focusMe') )

  _startingOffsets:
    card:
      top:  35
      left: 85
    text:
      top:  0
      left: 0
    image:
      top:  0
      left: 0
