#= require ../mixins/selectable
App.ItemView = Ember.View.extend App.SelectableMixin,
  classNameBindings: ['isSelected:selected']
  attributeBindings: ['style']

  style: Em.computed.alias 'model.computedStyle'

  doubleClick: ->
    @set('model.isEditing', true)
    Ember.run.later @, ( -> @$('textarea, input').focus() ), 0

  focusOut: ->
    @set('model.isEditing', false)
    @get('model').save()
