# puppet-ucarp
## Overview
This module installs (if desired) and configures the ucarp daemon.
## Module Description
A userland re-implementation of OpenBSD's CARP (Common Address Redundancy Protocol), an alternative to the patent encumbered VRRP.
## Testing
Operating Systems this has been tested on (pull requests for other OSs welcomed):
* Oracle Linux 7

## Usage
### Installing ucarp
```puppet
class {'::ucarp': }
```
### Adding VIPs
```puppet
ucarp::vip { 'wordpress-lb':
  password       => '12345', #same as my luggage
  source_address => '10.2.4.23',
  bind_interface => 'eth0',
  vip_address    => '10.2.4.25',
  options        => '--advskew 1 --advbase 1 --preempt --neutral'
}
```
### Using Hiera to manage VIPs
Syncronization between HA nodes is critical, using Hiera to configure the VIPs will help ensure that. 
```puppet
create_resources('ucarp::vip', hiera('ucarp::vip::lab'))
```
Hiera Json Example
```json
{
  "ucarp::vip::lab": {
    "wordpress-lb": {
      "id": "1",
      "bind_interface": "eth0",
      "source_address": "%{::ipaddress_eth0}",
      "vip_address": "10.3.9.102",
      "password": "test1234",
      "options": "--advskew 1 --advbase 1 --preempt --neutral"
    },
    "moodle-lb": {
      "id": "2",
      "bind_interface": "eth0",
      "source_address": "%{::ipaddress_eth0}",
      "vip_address": "10.3.9.103",
      "password": "test2345",
      "options": "--advskew 1 --advbase 1 --preempt --neutral"
    }
  }
}
```

 
