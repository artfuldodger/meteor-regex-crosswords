Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'notFound'

Router.route '/',
  name: 'crosswords'

Router.route '/crosswords/:_id',
  name: 'crossword',
  data: -> Crosswords.findOne(@params._id)

Router.onBeforeAction 'dataNotFound',
  only: 'crossword'

Router.route '/submit',
  name: 'crosswordSubmit'
