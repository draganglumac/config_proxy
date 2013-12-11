require 'model'

module Helpers

  def find_node_ip_from_connected_device_ip(device_ip)
    begin
      device = AutomationStack::Infrastructure::Device.find(:ip => device_ip)
      conn_device = AutomationStack::Infrastructure::ConnectedDevice.find(:device_id => device.id)
      machine = AutomationStack::Infrastructure::Machine.find(:id => conn_device.machine_id)
      machine.ip_address
    rescue
      nil
    end
  end

  def add_route_for_source_ip_of_the_request
    redirect_url = params[:redirect_url]
    calling_ip = params[:calling_ip]
    settings.dynamic_proxy_routes[calling_ip] = redirect_url
  end

  def remove_route_for_source_ip_of_the_request
    calling_ip = params[:calling_ip]
    settings.dynamic_proxy_routes[calling_ip] = nil
  end

  def get_url_for_SKG_config_hosted_on_node(node_ip)
    "http://#{node_ip}:8111/SKG/config.htm"
  end


  def get_url_for_SGA_config_hosted_on_node(node_ip)
    "http://#{node_ip}:8111/SGA/config.json"
  end

  def get_dynamic_redirect_url_for_device_ip(device_ip)
    settings.dynamic_proxy_routes[device_ip]
  end

end
