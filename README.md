Consul Service Registration Cookbook
====================================
If your node has a Consul agent created by the CIDA Consul Client cookbook or the Consul configuration cookbook at https://github.com/johnbellone/consul-cookbook this cookbook provides the ability to register a service with the consul agent running on the node. 

This set of recipes compiles the pre-requisite libraries as well as the NetCDF library

More information about NetCDF may be found [at the NetCDF website](http://www.unidata.ucar.edu/software/netcdf/docs/index.html)

Requirements
------------
### Platforms
- CentOS 6.6

Cookbooks
---------
- consul ( https://github.com/johnbellone/consul-cookbook )

Attributes
----------
 - `default["cida_consul_service"]["services"][service_name]["port"]` = Required. The port at which the service is listening. (Integer)
 - `default["cida_consul_service"]["services"][service_name]["tags"]` = Optional. An array of strings that are used to tag the service. (Array of String)
 - `default["cida_consul_service"]["services"][service_name]["interval"]` = Optional. A string representing time. Instructs how often the agent should check the service. (e.g. "10s") (String) ( See https://consul.io/docs/agent/checks.html  )
 - `default["cida_consul_service"]["services"][service_name]["script"]` = Optional. "echo ok" (String) ( See https://consul.io/docs/agent/checks.html )

Usage
-----
- To register service, include the "cida_consul_service::register_service" recipe after Consul agent is installed and application is launched.
- Example attributes:

    default["cida_consul_service"]["services"]["caching"]["port"] = 6739
    
    default["cida_consul_service"]["services"]["caching"]["tags"] = ["caching"]
    
    default["cida_consul_service"]["services"]["check"]["interval"] = "10s"
    
    default["cida_consul_service"]["services"]["check"]["script"] = "echo ok"
    
    default["cida_consul_service"]["services"]["msg_broker"]["port"] = 5672
    
    default["cida_consul_service"]["services"]["msg_broker"]["tags"] = ["messaging"]
 
Authors
-------
- Author:: Ivan Suftin (<isuftin@usgs.gov>)

License
-------
Unless otherwise noted below, this software is in the public domain because it contains
materials that originally came from the United States Geological Survey, an agency of the
United States Department of Interior. For more information, see the official USGS
copyright policy at: http://www.usgs.gov/visual-id/credit_usgs.html#copyright

More information in [license file](https://github.com/USGS-WSI-COOKBOOKS/stig/blob/master/LICENSE)