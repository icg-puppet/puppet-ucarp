class ucarp::params {
  $package_name   = 'ucarp'
  $package_ensure = 'present'
  $manage_package = true
  $manage_service = true
  $service_ensure = 'running'

  case $::osfamily {
    redhat: {
      $config_dir     = '/etc/ucarp'
      $service_name   = 'ucarp@.service'
    }
    default: {
      fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
    }
  }
}
