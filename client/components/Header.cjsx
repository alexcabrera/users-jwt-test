React = require 'react'

module.exports   = React.createClass
    displayName: 'Header'
    render: ->
        <div className='Header'>
            <nav className='_GlobalNavigation__'>
                <button className='_LoginButton'>Sign In</button>
            </nav>
        </div>
