App.BoardView = Ember.View.extend
  tagName: "section"
  elementId: "board"

  didInsertElement: ->
    @droppable()
    @selectable()
    @backspaceKey()

  backspaceKey: ->
    Mousetrap.bind "backspace", =>
      return if @get('controller.isEditing')
      @get('controller').destroySelected()
      return false

  willDestroyElement: ->
    Mousetrap.unbind "backspace"

  droppable: ->
    @$().droppable
      accept: ".new_card, .new_text, .new_image"
      drop: (event, ui) =>
        kind = ui.draggable.data('kind')
        @get('controller').createItem(kind, ui.offset.top, ui.offset.left)

  selectable: ->
    @$().selectable
      distance: 20
      filter: ".card_container, .text, .image"
      start: (event, ui) =>
        @get('controller').clearSelected() unless event.shiftKey

      selected: (event, ui) =>
        view = Ember.View.views[ui.selected.id]
        if event.shiftKey
          view.invertSelection()
        else
          view.selectMe()

  click: -> @get('controller').clearSelected()
