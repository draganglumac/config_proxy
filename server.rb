$: << 'src'

require 'sinatra'
require 'helpers'

include Helpers

get '/config' do
  device_ip = request.env['REMOTE_ADDR']
  node_ip = find_node_ip_from_connected_device_ip(device_ip)
  puts "node_ip = #{node_ip} for device_ip = #{device_ip}"

  redirect 'http://www.google.co.uk' if device_ip == '192.168.1.79'
  redirect 'http://www.yahoo.com' if device_ip == '192.168.1.86'
end
