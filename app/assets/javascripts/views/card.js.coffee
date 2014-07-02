App.CardView = Ember.View.extend
  classNames: ['card_container']
  attributeBindings: ['style']

  model: Em.computed.alias 'controller.model'

  didInsertElement: ->
    @$().draggable
      containment: '#board'
      snap: true
      snapMode: 'outer'
      snapTolerance: 20
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
