React   = require 'react'
Base    = require './Base.cjsx'

module.exports = React.createClass
    displayName: 'Login'

    render: ->
        <Base page='Login'>
            <form className='LoginForm'>
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
        </Base>
