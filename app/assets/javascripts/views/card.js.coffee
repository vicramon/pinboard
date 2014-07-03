App.CardView = Ember.View.extend
  classNames: ['card_container']
  classNameBindings: ['isSelected:selected']
  attributeBindings: ['style']

  board: Em.computed.alias 'controller.controllers.board'
  model: Em.computed.alias 'controller.model'
  selectedItems: Em.computed.alias 'board.selectedItems'
  style: Em.computed.alias 'model.computedStyle'

  isSelected: ( ->
    true if @get('selectedItems').find (item) =>
      item == @get('model')
  ).property('selectedItems.@each')

  didInsertElement: ->
    @draggable()

  draggable: ->
    @$().draggable
      containment: '#board'
      distance: 15
      snap: '.card_container'
      snapMode: 'both'
      snapTolerance: 3
      start: (event, ui) =>
        @handleDragStartSelection()

        @get('selectedItems').forEach (item) =>
          item.set 'startTop',  item.get('top')
          item.set 'startLeft', item.get('left')

      drag: (event, ui) =>
        model = @get('model')
        top_distance  =  model.get('top') - ui.position.top
        left_distance = model.get('left') - ui.position.left

        @get('selectedItems').forEach (item) =>
          return if item == @get('model')
          item.set 'top',  item.get('startTop')  - top_distance
          item.set 'left', item.get('startLeft') - left_distance

      stop: (event, ui) =>
        position = $(event.target).position()
        @get('model').setProperties
          top: position.top
          left: position.left
        @get('model').save()

  selectMeOnly: -> @set 'selectedItems', [@get('model')]
  selectMe: ->     @get('selectedItems').addObject(@get('model'))
  deselectMe: ->   @get('selectedItems').removeObject(@get('model'))
  invertSelection: -> if @get('isSelected') then @deselectMe() else @selectMe()

  click: (event) ->
    @handleClickSelection()
    return false

  handleDragStartSelection: ->
    return @selectMe() if event.shiftKey or Em.isEmpty(@get('selectedItems'))
    return @selectMeOnly() unless @get('isSelected')

  handleClickSelection: ->
    if event.shiftKey
      @invertSelection()
    else
      @selectMeOnly()

  doubleClick: ->
    @set('controller.isEditing', true)
    Ember.run.later @, ( -> @$('textarea').focus() ), 0

  focusOut: ->
    @set('controller.isEditing', false)
    @get('model').save()
