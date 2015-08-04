React = require 'react'
LoginForm = require './LoginForm.cjsx'

if document.querySelector('.Login__')
    React.render <LoginForm />, document.querySelector('._PageContent__')
