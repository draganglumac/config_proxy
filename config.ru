$: << '.'

require 'thin'
require 'server'

Thin::Server.start('0.0.0.0', 8111, Sinatra::Application)
