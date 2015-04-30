class ucarp::install {
  if $ucarp::params::manage_package {
    Package {$ucarp::params::package_name:
      ensure => $ucarp::params::package_ensure
    }
  }
}
