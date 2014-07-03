App.Item = DS.Model.extend
  kind:       DS.attr('string')
  text:       DS.attr('string')
  url:        DS.attr('string')
  height:     DS.attr('number')
  width:      DS.attr('number')
  top:        DS.attr('number')
  left:       DS.attr('number')
  board:      DS.belongsTo('board')

  isCard: Em.computed.equal 'kind', 'card'
  isText: Em.computed.equal 'kind', 'text'
  isImage: Em.computed.equal 'kind', 'image'

  computedStyle: ( ->
    """
    top: #{@get('top')}px;
    left: #{@get('left')}px;
    """
  ).property('top', 'left')
