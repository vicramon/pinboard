App.AutoWidthTextField = Ember.TextField.extend
  attributeBindings: ['style']

  style: ( ->
    return unless @get('value')?.trim().length > 0
    pixels = (@get('value').length) * 10
    "width: " + pixels.toString() + "px;"
  ).property('value')
