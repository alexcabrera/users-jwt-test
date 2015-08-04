React   = require 'react'
request = require 'superagent'

module.exports = React.createClass
    displayName: 'LoginForm'
    _handleSubmit: (e) ->
        e.preventDefault()
        console.log @refs
        console.log @refs.username.value
        console.log @refs.password.value
        # request
        #     .post('http://localhost:8080/login')
        #     .send({
        #
        #     })
        #
    render: ->
        <form className='LoginForm' onSubmit={@_handleSubmit}>
            <div className='_FormInput'>
                <label>Username</label>
                <input type="text" ref="username" placeholder='dev'/>
            </div>
            <div className='_FormInput'>
                <label>Password</label>
                <input type="password" ref="password" placeholder='dev' />
            </div>
            <button type="submit" className='_FormSubmit'>
                Sign In
            </button>
        </form>
