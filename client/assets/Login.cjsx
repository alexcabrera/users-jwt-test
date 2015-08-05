React = require 'react'

LoginModal = React.createClass
    displayName: 'Login'
    _handleSubmit: (e) ->
        e.preventDefault()
        console.log 'submit!'

    render: ->

        <div className'LoginModal__'>
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
        </div>

class Login
    constructor: ->
        trigger_el = docuemnt.querySelector('.Header ._LoginButton')
        trigger_el.addEventListener 'click', (e) ->
            login_overlay = document.createElement('div')
            login_overlay.classList.add '_LoginOverlay__'
            document.body.appendChild(login_overlay)
            React.render(<LoginModal />, login_overlay)

module.exports = Login
require('marquee-static-sdk/client/client_modules').register('Login', module.exports)
