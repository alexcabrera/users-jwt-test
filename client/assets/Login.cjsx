React   = require 'react'
request = require 'superagent'

LoginModal = React.createClass
    displayName: 'LoginModal'

    _handleSubmit: (e) ->
        # Stop standard form submission, grab username and password elements
        e.preventDefault()
        username_el = React.findDOMNode(@refs.username)
        password_el = React.findDOMNode(@refs.password)

        # Make sure the user has filled in the username and password fields
        unless username_el.value
            username_el.classList.add '-error'
        unless password_el.value
            password_el.classList.add '-error'

        # If we have a username and password, attempt login
        if username_el.value and password_el.value
            request.post('http://localhost:8080/login')
                .type('json')
                .send({
                    username: username_el.value
                    password: password_el.value
                })
                .end (err, res) =>

                    # If the login was successful, store the JWT in session.
                    # Then we can close our modal.
                    unless err
                        sessionStorage.token = res.body
                        layout_overlay = document.getElementsByClassName('_LoginOverlay__')[0]
                        React.unmountComponentAtNode layout_overlay

    componentWillUnmount: ->
        layout_overlay = document.getElementsByClassName('_LoginOverlay__')[0]
        document.body.removeChild layout_overlay

    render: ->

        <div className='LoginModal__'>
            <form className='LoginForm' onSubmit={@_handleSubmit}>
                <h1 className='_FormHeading'>Sign In</h1>
                <p className='_FormDirections'>
                    Use <em>dev</em> for both the username and password.
                </p>
                <span className='_FormField'>
                    <label className='_FormLabel'>Username</label>
                    <input className='_FormInput' type='text' ref='username' defaultValue='dev' />
                </span>
                <span className='_FormField'>
                    <label className='_FormLabel'>Password</label>
                    <input className='_FormInput' type='text' ref='password' defaultValue='dev' />
                </span>
                <button className='_FormSubmit' type='submit'>Sign In</button>
            </form>
        </div>


class Login
    constructor: ->
        trigger_el = document.querySelector('.Header ._LoginButton')
        trigger_el.addEventListener 'click', (e) ->
            # Create the overlay element and render the modal into it
            login_overlay = document.createElement 'div'
            login_overlay.classList.add '_LoginOverlay__'
            document.body.appendChild login_overlay
            React.render <LoginModal />, login_overlay


module.exports = Login
require('marquee-static-sdk/client/client_modules').register('Login', module.exports)
