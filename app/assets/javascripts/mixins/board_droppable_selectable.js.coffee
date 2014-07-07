App.BoardDroppableSelectableMixin = Ember.Mixin.create

  didInsertElement: ->
    @droppable()
    @selectable()

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

