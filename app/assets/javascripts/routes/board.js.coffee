App.BoardRoute = Ember.Route.extend

  model: (params) -> @store.find('board', params.id)

  renderTemplate: (controller, model) ->
    @_super controller, model
    this.render 'boardTools',
      into: 'application'
      outlet: 'boardTools'
      controller: controller
