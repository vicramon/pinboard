App.NewItemMixin = Ember.Mixin.create
  attributeBindings: ['data-kind']

  didInsertElement: ->
    @$().draggable
      appendTo: '#board'
      cursor: 'pointer'
      cursorAt: @get('cursorAt')
      helper: @helper

  'data-kind': null
  helper: Em.K
  cursorAt: {}
