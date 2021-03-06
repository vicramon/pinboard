App.ItemSelectableMixin = Ember.Mixin.create
  board: Em.computed.alias 'controller.controllers.board'
  model: Em.computed.alias 'controller.model'
  selectedItems: Em.computed.alias 'board.selectedItems'

  isSelected: ( ->
    true if @get('selectedItems').find (item) =>
      item == @get('model')
  ).property('selectedItems.@each')

  stopEditingOnDeselection: ( ->
    @set 'model.isEditing', false  unless @get('isSelected')
  ).observes('isSelected')

  didInsertElement: ->
    @draggable()

  draggable: ->
    @$().draggable
      containment: '#board'
      distance: 15
      snap: '.card_container, .text, .image'
      snapMode: 'both'
      snapTolerance: 3
      start: (event, ui) =>
        @handleDragStartSelection(event)

        @get('selectedItems').forEach (item) =>
          item.set 'startTop',  item.get('top')
          item.set 'startLeft', item.get('left')

      drag: (event, ui) =>
        model = @get('model')
        top_distance  = model.get('top')  - ui.position.top
        left_distance = model.get('left') - ui.position.left

        @get('selectedItems').without(@get('model')).forEach (item) =>
          item.set 'top',  item.get('startTop')  - top_distance
          item.set 'left', item.get('startLeft') - left_distance

      stop: (event, ui) =>
        offset = $(event.target).offset()
        top = offset.top + $("#board").scrollTop() - $('#board').offset().top
        left = offset.left + $("#board").scrollLeft() - $('#board').offset().left
        @get('model').setProperties top: top, left: left
        @get('selectedItems').forEach (item) => item.save() if item.get('isDirty')

  selectMeOnly: -> @set 'selectedItems', [@get('model')]
  selectMe: ->     @get('selectedItems').addObject(@get('model'))
  deselectMe: ->   @get('selectedItems').removeObject(@get('model'))
  invertSelection: -> if @get('isSelected') then @deselectMe() else @selectMe()

  click: (event) ->
    @handleClickSelection(event)
    return false

  handleDragStartSelection: (event) ->
    return @selectMe() if event.shiftKey or Em.isEmpty(@get('selectedItems'))
    return @selectMeOnly() unless @get('isSelected')

  handleClickSelection: (event) ->
    if event.shiftKey
      @invertSelection()
    else
      @selectMeOnly()
