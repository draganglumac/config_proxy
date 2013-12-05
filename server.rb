$: << 'src'
require 'sinatra'
require 'model'

get '/config' do
  source_ip = request.env['REMOTE_ADDR']
  # devices = AutomationStack::Infrastructure::Device.where(:ip => (not nil))
  device = AutomationStack::Infrastructure::Device.where(:ip => source_ip)

  redirect 'http://www.google.co.uk' if source_ip == '192.168.1.79'
  redirect 'http://www.yahoo.com' if source_ip == '192.168.1.86'
end
