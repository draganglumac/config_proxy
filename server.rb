$: << 'src'

require 'sinatra'
require 'helpers'

include Helpers

not_found do
  "Your device IP didn't match any node so I don't know where to redirect your request. Please check your configuration."
end

get '/SKG/config.htm' do
  device_ip = request.env['REMOTE_ADDR']
  node_ip = find_node_ip_from_connected_device_ip(device_ip)
  puts "node_ip = #{node_ip} for device_ip = #{device_ip}"

  redirect "http://#{node_ip}/SKG/config.htm" if not node_ip.nil?
end
