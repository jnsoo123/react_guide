@Items = React.createClass
  getInitialState: ->
    items: @props.data
  getDefaultProps: ->
    items: []
  addRecord: (item) ->
    items = @state.items.slice()
    items.push item
    @setState items: items
  render: ->
    React.DOM.div
      className: 'items'
      React.DOM.h2
        className: 'title'
        'Items'
      React.createElement ItemForm, handleNewItem: @add_record
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Description'
        React.DOM.tbody null,
          for item in @state.items
            React.createElement Item, key: item.id, item: item
