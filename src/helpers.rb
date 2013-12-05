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

end
