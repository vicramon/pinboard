App.BoardView = Ember.View.extend
  tagName: "section"
  elementId: "board"

  didInsertElement: ->
    @droppable()
    Mousetrap.bind "backspace", =>
      @get('controller').destroySelected()
      return false

  willDestroyElement: ->
    Mousetrap.unbind "backspace"

  droppable: ->
    @$().droppable
      accept: ".new_card"
      drop: (event, ui) =>
        @get('controller').createCard(ui.offset.top, ui.offset.left)

  click: ->
    @set 'controller.selectedItems', []
