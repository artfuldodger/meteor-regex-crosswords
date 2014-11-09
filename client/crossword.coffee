Template.crossword.helpers
  crossword: ->
    Crosswords.findOne()

  columns: ->
    @columns

  rows: ->
    @rows

Template.submit.events
  'click input': (event) ->
    $(event.target).attr('value', 'You clicking me, bro?')
