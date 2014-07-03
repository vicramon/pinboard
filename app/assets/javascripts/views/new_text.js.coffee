App.NewTextView = Ember.View.extend App.NewItemMixin,
  classNames: ["new_text"]
  template: Em.Handlebars.compile("+ Text")

  'data-kind': 'text'
  helper: -> $('<div />', class: 'new_text_helper')
