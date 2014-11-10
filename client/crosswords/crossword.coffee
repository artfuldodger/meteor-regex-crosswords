Template.crosswords.helpers
  crosswords: ->
    Crosswords.find()

Template.crossword.helpers
  crossword: ->
    Crosswords.findOne()

  columns: ->
    @columns

  rows: ->
    @rows

Template.crossword.events
  'submit form': (event) ->
    $('input[type=submit]').attr('value', 'You clicking me, bro?')
    false
