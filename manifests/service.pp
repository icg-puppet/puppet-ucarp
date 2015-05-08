class ucarp::service {
  if $ucarp::params::manage_service {

    if $::osfamily == 'RedHat' and $::lsbmajdistrelease == '7' {
      #the ucarp package on rhel7 and variants 
      exec { "el7_networking_hack":
        path    => "/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin",
        command => "echo \"NETWORKING=yes\" >> /etc/sysconfig/network",
        unless  => "egrep -c \"^NETWORKING=\" /etc/sysconfig/network",
      }
    }
    service {$ucarp::params::service_name:
      ensure => $ucarp::params::service_ensure
    }
  }
}
