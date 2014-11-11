Template.crosswords.helpers
  crosswords: ->
    Crosswords.find()

Template.crossword.helpers
  columns: ->
    @columns

  rows: ->
    _.map @rows, (row) =>
      {
        name: row,
        columns: @columns
      }

Template.crossword.events
  'submit form': (event) ->
    $('input[type=submit]').attr('value', 'You clicking me, bro?')
    false

Template.crosswordSubmit.events
  'click .add-column': (event) ->
    $('.columns').append('<input name="column" type="text" class="form-control" placeholder="Regex">')

  'click .add-row': (event) ->
    $('.rows').append('<input name="row" type="text" class="form-control" placeholder="Regex">')

  'submit form': (event) ->
    event.preventDefault()

    post = {
      name:    $('input[name=name]').val()
      columns: _.map $('input[name="column"]'), (el) -> $(el).val()
      rows:    _.map $('input[name="row"]'), (el) -> $(el).val()
    }

    post._id = Crosswords.insert(post)

    Router.go('crossword', post)
