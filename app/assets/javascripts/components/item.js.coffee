@Item = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.item.name
      React.DOM.td null, @props.item.description
