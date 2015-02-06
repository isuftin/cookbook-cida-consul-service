name             'cida_consul_service'
maintainer       'Ivan Suftin'
maintainer_email 'isuftin@usgs.gov'
license          'Public Domain'
description      'Registers a service with a consul agent. Future: Also contains other services to register keys, events, etc'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

depends 'consul'