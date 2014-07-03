App.CardView = Ember.View.extend
  classNames: ['card_container']
  classNameBindings: ['selected']
  attributeBindings: ['style']

  board: Em.computed.alias 'controller.controllers.board'
  model: Em.computed.alias 'controller.model'
  selectedItems: Em.computed.alias 'board.selectedItems'
  style: Em.computed.alias 'model.computedStyle'

  selected: ( ->
    true if @get('selectedItems').find (item) =>
      item == @get('model')
  ).property('selectedItems.@each')

  didInsertElement: ->
    @draggable()

  draggable: ->
    @$().draggable
      containment: '#board'
      snap: '.card_container'
      snapMode: 'both'
      snapTolerance: 10
      start: =>
        @handleSelection()

      stop: (event, ui) =>
        position = $(event.target).position()
        @get('model').setProperties
          y_position: position.top
          x_position: position.left
        @get('model').save()

  selectMeOnly: -> @set 'selectedItems', [@get('model')]
  selectMe: -> @get('selectedItems').addObject(@get('model'))

  click: (event) ->
    @handleSelection()
    return false

  handleSelection: ->
    if event.shiftKey
      @selectMe()
    else
      @selectMeOnly()

  doubleClick: ->
    @set('controller.isEditing', true)
    Ember.run.later @, ( -> @$('textarea').focus() ), 0

  focusOut: ->
    @set('controller.isEditing', false)
    @get('model').save()
