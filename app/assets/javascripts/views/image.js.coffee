App.ImageView = App.ItemView.extend
  classNames: ['image']
  tagName: 'img'
  attributeBindings: ['url:src']

  style: Em.computed.alias 'model.imageComputedStyle'

  url: Em.computed.alias 'model.url'
