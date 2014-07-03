App.BoardView = Ember.View.extend
  tagName: "section"
  elementId: "board"

  didInsertElement: ->
    @droppable()
    @selectable()
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

  selectable: ->
    @$().selectable
      distance: 20
      filter: ".card_container"
      start: (event, ui) =>
        @get('controller').clearSelected() unless event.shiftKey

      selected: (event, ui) =>
        view = Ember.View.views[ui.selected.id]
        if event.shiftKey
          view.invertSelection()
        else
          view.selectMe()

  click: -> @get('controller').clearSelected()
