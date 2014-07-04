#= require ../mixins/selectable
App.ItemView = Ember.View.extend App.SelectableMixin,
  classNameBindings: ['isSelected:selected']
  attributeBindings: ['style']

  didInsertElement: ->
    @_super()
    @get('controller.model').on 'focusMe', $.proxy(@, 'focusMe')

  style: Em.computed.alias 'model.computedStyle'

  focusMe: -> Ember.run.later @, ( -> @$('textarea, input').focus() ), 0

  doubleClick: ->
    @set('model.isEditing', true)
    @focusMe()

  focusOut: ->
    @set('model.isEditing', false)
    @get('model').save()
