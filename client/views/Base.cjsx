React       = require 'react'
{ Asset }   = require 'marquee-static-sdk/base'


module.exports = React.createClass
    displayName: 'Base'
    render: ->

        <html>
            <head>
                <meta charSet="UTF-8" />
                <Asset path='style.sass' />
            </head>
            <body className="Site__ #{@props.page}__">

                <div className='_PageContent__'>
                    { @props.children }
                </div>
        
                <Asset path='script.coffee' />
            </body>
        </html>
