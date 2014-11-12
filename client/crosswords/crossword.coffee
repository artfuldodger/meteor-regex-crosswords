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
    event.preventDefault()

    crosswordId = @_id
    # This seems to be saving data sanely - except when we lose an input somehow
    # but often, when blurring one input, its value gets persisted but the value
    # *appears* in it and its next neighbor, although it does not get persisted
    # for the neighbor until another blur event is fired.
    values = _.map $('.value-row'), (row) ->
      _.map $(row).find('input'), (input) -> $(input).val()

    Crosswords.update(crosswordId, { $set: { values: values } })
    false

  'blur input.value': (event) ->
    # why is `this` different here than with `submit form` event?
    # console.log @_id
    $('form').submit()

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

    post['values'] = _.map post.rows, (row) ->
      _.map post.columns, (col) -> ''

    post._id = Crosswords.insert(post)

    Router.go('crossword', post)
