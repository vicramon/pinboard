#= require ../mixins/board_droppable_selectable
App.BoardView = Ember.View.extend App.BoardDroppableSelectableMixin,
  tagName: "section"
  elementId: "board"

  didInsertElement: ->
    @_super()
    @backspaceKey()

  backspaceKey: ->
    Mousetrap.bind "backspace", =>
      return if @get('controller.isEditing')
      @get('controller').destroySelected()
      return false

  willDestroyElement: ->
    Mousetrap.unbind "backspace"

  click: -> @get('controller').clearSelected()
