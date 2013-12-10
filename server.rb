$: << 'src'

require 'sinatra'
require 'helpers'

include Helpers

set :dynamic_proxy_routes, {}

post '/SKG/proxy/add_route' do
  add_route_or_source_ip_of_the_request
end

post '/SKG/proxy/remove_route' do
  remove_route_for_source_ip_of_the_request
end

get '/SKG/proxy/remove_route' do 
  remove_route_for_source_ip_of_the_request
end

get '/SKG/config.htm' do
  device_ip = request.env['REMOTE_ADDR']
  node_ip = find_node_ip_from_connected_device_ip(device_ip)

  if not node_ip.nil?
    redirect "http://#{node_ip}:8111/SKG/config.htm"
  else
    redirect_url = settings.dynamic_proxy_routes[device_ip]
    redirect redirect_url if not redirect_url.nil?
  end
end
