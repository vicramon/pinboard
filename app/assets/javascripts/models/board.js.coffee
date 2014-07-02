App.Board = DS.Model.extend
  name:  DS.attr('string')
  user:  DS.belongsTo('user')
  items: DS.hasMany('item')
