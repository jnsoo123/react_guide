@ItemForm = React.createClass
  getInitialState: ->
    name: ''
    description: ''

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { item: @state }, (data) =>
      @props.handleNewItem data
      @setState @getInitialState()
    , 'JSON'

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  valid: ->
    @state.name && @state.description

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Enter item name'
          name: 'name'
          value: @state.name
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.textarea
          className: 'form-control'
          placeholder: 'Enter item description'
          name: 'description'
          value: @state.description
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create Item'
