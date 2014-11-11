Template.crosswords.helpers
  crosswords: ->
    Crosswords.find()

Template.crossword.helpers
  columns: ->
    @columns

  values: ->
    @values

Template.crossword.events
  'submit form': (event) ->
    $('input[type=submit]').attr('value', 'You clicking me, bro?')
    false

  'blur input.value': (event) ->
    console.log params

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

    post['values'] = _.map post.columns, (col) ->
      [
        _.map post.rows, (row) -> ''
      ]


    post._id = Crosswords.insert(post)

    Router.go('crossword', post)
