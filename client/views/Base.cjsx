React = require 'react'

{
    ActivateClientModules
    Asset
} = require 'marquee-static-sdk/base'

Header = require '../components/Header.cjsx'

module.exports = React.createClass
    displayName: 'Base'
    render: ->
        client_modules = ActivateClientModules.merge @props.client_modules, {
            Login : []
        }
        
        <html>
            <head>
                <meta charSet="UTF-8" />
                <Asset path='style.sass' />
            </head>
            <body className="Site__ #{@props.page}__">

                <div className='_SiteHeader__'>
                    <Header />
                </div>

                <div className='_SiteContent__'>
                    { @props.children }
                </div>

                <Asset path='script.coffee' />
                <ActivateClientModules modules=client_modules immediate=true />
            </body>
        </html>
