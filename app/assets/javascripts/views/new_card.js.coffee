#= require ../mixins/new_item
App.NewCardView = Ember.View.extend App.NewItemMixin,
  classNames: ["new_card"]
  template: Em.Handlebars.compile("+ Card")
  # tagName: 'img'
  # attributeBindings: ['src']
  # src: '/assets/icons/card.png'

  'data-kind': 'card'
  cursorAt: { top: 30, left: 48 }
  helper: -> $('<div />', class: 'new_card_helper')
