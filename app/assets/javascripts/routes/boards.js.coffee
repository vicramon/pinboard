App.BoardsRoute = Ember.Route.extend(
  model: -> @store.find('board')
)
