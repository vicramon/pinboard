App.BoardRoute = Ember.Route.extend

  model: (params) -> @store.find('board', params.id)
