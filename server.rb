$: << 'src'

require 'sinatra'
require 'helpers'

include Helpers

set :dynamic_proxy_routes, {}

post '/SKG/proxy/add_route' do
  add_route_for_source_ip_of_the_request
end

post '/SKG/proxy/remove_route' do
  remove_route_for_source_ip_of_the_request
end

get '/myip' do
  request.env['REMOTE_ADDR']
end


get '/SGA/config.json' do
  device_ip = request.env['REMOTE_ADDR']
  node_ip = find_node_ip_from_connected_device_ip(device_ip)

  if node_ip
    redirect get_url_for_SGA_config_hosted_on_node(node_ip)
  else
    redirect_url = get_dynamic_redirect_url_for_device_ip(device_ip)
    redirect redirect_url if redirect_url
  end
end

get '/SKG/config.htm' do
  device_ip = request.env['REMOTE_ADDR']
  redirect_url = get_dynamic_redirect_url_for_device_ip(device_ip)
  redirect redirect_url if redirect_url
end
