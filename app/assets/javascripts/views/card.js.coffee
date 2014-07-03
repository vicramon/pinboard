App.CardView = Ember.View.extend
  classNames: ['card_container']
  attributeBindings: ['style']

  board: Em.computed.alias 'controller.controllers.board'
  model: Em.computed.alias 'controller.model'
  style: Em.computed.alias 'model.computedStyle'

  didInsertElement: ->
    @draggable()

  draggable: ->
    @$().draggable
      containment: '#board'
      snap: '.card_container'
      snapMode: 'both'
      snapTolerance: 10

      stop: (event, ui) =>
        position = $(event.target).position()
        @get('model').setProperties
          y_position: position.top
          x_position: position.left
        @get('model').save()

  style: Em.computed.alias 'model.computedStyle'

  doubleClick: ->
    @set('controller.isEditing', true)
    Ember.run.later @,
      ( -> @$('textarea').focus() ), 0

  focusOut: ->
    @set('controller.isEditing', false)
    @get('model').save()
