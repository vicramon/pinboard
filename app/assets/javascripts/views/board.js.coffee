App.BoardView = Ember.View.extend
  tagName: "section"
  elementId: "board"

  didInsertElement: ->
    @droppable()

  droppable: ->
    @$().droppable
      accept: ".new_card"
      drop: (event, ui) =>
        @get('controller').createCard(ui.offset.top, ui.offset.left)
