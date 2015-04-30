class ucarp::params {
  $package        = 'ucarp'
  $package_ensure = 'present'
  $manage_package = true

  case $::osfamily {
    redhat: {
      $config_dir     = '/etc/ucarp'
    }
    default: {
      fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
    }
  }
}
