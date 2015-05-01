class ucarp::install  {
  if $ucarp::params::manage_package {
    package {$ucarp::params::package_name:
      ensure => $ucarp::params::package_ensure
    }
  }
}
