#
# Cookbook Name:: cida_consul_service
# Recipe:: register_service
# Author: Ivan Suftin < isuftin@usgs.gov >
#
# Description: Registers a service with a running consul agent.
# Example attributes register a service:
# default["cida_consul_service"]["services"]["caching"]["port"] = 6739
# default["cida_consul_service"]["services"]["caching"]["tags"] = ["caching"]
# default["cida_consul_service"]["services"]["check"]["interval"] = "10s"
# default["cida_consul_service"]["services"]["check"]["script"] = "echo ok"
# default["cida_consul_service"]["services"]["msg_broker"]["port"] = 5672
# default["cida_consul_service"]["services"]["msg_broker"]["tags"] = ["messaging"]

services = node["cida_consul_service"]["services"]
consul_config_filename = File.join(node['consul']['config_dir'], 'default.json')

service 'consul' do
   supports :status => true, :restart => true, :reload => true
   action [:enable, :start]
   subscribes :restart, "file[#{consul_config_filename}", :delayed
 end

services.each do |svc, att|
  port = att.port
  tags = att.key?("tags") ? att.tags : []
  check = att.key?("check") ? att.check : nil
    
  if check.nil?
    consul_service_def svc do
      port port
      tags tags
      notifies :reload, 'service[consul]'
    end
  else
    consul_service_def svc do
      port port
      tags tags
      check check
      notifies :reload, 'service[consul]'
    end
  end
  
end