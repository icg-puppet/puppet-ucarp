class ucarp::service {
  if $ucarp::params::manage_service {
    service {$ucarp::params::service_name:
      ensure => $ucarp::params::service_ensure
    }
  }
}
