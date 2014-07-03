App.ImageView = App.ItemView.extend
  classNames: ['image']
  tagName: 'img'
  attributeBindings: ['url:src']

  url: Em.computed.alias 'model.url'
