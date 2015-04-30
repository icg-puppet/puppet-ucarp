class ucarp::params {
  $package        = 'ucarp'
  $package_ensure = 'present'
  $manage_package = true
  $config_dir     = '/etc/ucarp'

  case $::osfamily {
    redhat: {
      $config_dir     = '/etc/ucarp'
    }
    default: {
      fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
    }
  }
}
