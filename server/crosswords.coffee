Meteor.startup ->
  if Crosswords.find().count() is 0
    Crosswords.insert(
      name: 'Home Town Pride'
      columns: [
        '[G|O|F]'
        '[O|R|A]'
        '[K|E|R]'
      ],
      rows: [
        '[G|O|K]'
        '[O|K]'
        '[F|A|R]'
      ],
      values: [
        ['', '', ''],
        ['', '', '']
        ['', '', '']
      ]
    )
