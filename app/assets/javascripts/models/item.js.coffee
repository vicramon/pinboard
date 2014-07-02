App.Item = DS.Model.extend
  kind:       DS .attr('string')
  text:       DS .attr('string')
  height:     DS .attr('number')
  width:      DS .attr('number')
  x_position: DS .attr('number')
  y_position: DS .attr('number')
  board:      DS .belongsTo('board')

  isCard: Em.computed.equal 'kind', 'card'

  computedStyle: ( ->
    """
    top: #{@get('y_position')}px;
    left: #{@get('x_position')}px;
    """
  ).property('width', 'height')
