App.Router.reopen
  location: 'auto'
  rootURL: '/'

App.Router.map () ->
  @resource 'boards', ->
    @resource 'board', path: '/:id'
