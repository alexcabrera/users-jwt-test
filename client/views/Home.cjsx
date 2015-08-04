React = require 'react'

Base = require './Base.cjsx'

module.exports = React.createClass
    displayName: 'Home'
    render: ->

        <Base page='Home'>
            <nav>
                <a href='/login/'>Login</a>
            </nav>
        </Base>
