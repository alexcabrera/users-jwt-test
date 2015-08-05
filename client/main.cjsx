React = require 'react'

Home    = require './views/Home.cjsx'
Login   = require './views/Login.cjsx'

module.exports = ({ emitFile, done }) ->
    emitFile('/', <Home />)
    done()
