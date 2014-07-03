App.NewImageView = Ember.View.extend App.NewItemMixin,
  classNames: ["new_image"]
  template: Em.Handlebars.compile("+ Image")

  'data-kind': 'image'
  helper: -> $('<div />', class: 'new_image_helper')
  cursorAt: { top: 5, left: 40 }
