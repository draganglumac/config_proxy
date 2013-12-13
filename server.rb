$: << 'src'

require 'sinatra'
require 'helpers'

include Helpers

set :dynamic_proxy_routes, {}

post '/proxy/add_route' do
  add_route_for_source_ip_of_the_request
end

post '/proxy/remove_route' do
  remove_route_for_source_ip_of_the_request
end

get '/myip' do
  request.env['REMOTE_ADDR']
end

get '/SGA/config.json' do
  device_ip = request.env['REMOTE_ADDR']
  redirect_url = get_dynamic_redirect_url_for_device_ip(device_ip)
  redirect redirect_url if redirect_url
end

get '/SKG/config.htm' do
  device_ip = request.env['REMOTE_ADDR']
  redirect_url = get_dynamic_redirect_url_for_device_ip(device_ip)
  redirect redirect_url if redirect_url
end
