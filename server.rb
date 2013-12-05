require 'sinatra'
require 'pry'
require 'pry-debugger'

get '/config' do
  redirect 'http://www.google.co.uk' if request.env['REMOTE_ADDR'] == '192.168.1.79'
  redirect 'http://www.yahoo.com' if request.env['REMOTE_ADDR'] == '192.168.1.86'
end
