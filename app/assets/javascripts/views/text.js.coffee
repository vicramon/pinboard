App.TextView = App.ItemView.extend
  classNames: ['text']

  inputWidthStyle: ( ->
    "width: " + (@get('model.text').length + 1) * 8 + ";"
  ).property('text')

  doubleClick: ->
    @_super()
    @enterKey()

  enterKey: -> Mousetrap.bind 'enter', => @get('model').set 'isEditing', false

  enterKeyHandler: ( ->
    Mousetrap.unbind 'enter' unless @get('isEditing')
  ).observes('isEditing')
