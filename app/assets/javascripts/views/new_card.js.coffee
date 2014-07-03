App.NewCardView = Ember.View.extend
  classNames: ["new_card"]
  template: Em.Handlebars.compile("+ Card")

  didInsertElement: ->
    @$().draggable
      appendTo: '#board'
      cursor: 'pointer'
      cursorAt:
        top: 30
        left: 48
      helper: -> $('<div />', class: 'new_card_helper')
