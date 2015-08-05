React = require 'react'

Home    = require './views/Home.cjsx'

module.exports = ({ emitFile, done }) ->
    emitFile('/', <Home />)
    done()
