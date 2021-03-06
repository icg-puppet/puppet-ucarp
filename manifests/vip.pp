define ucarp::vip (
    $id,
    $password,
    $source_address,
    $bind_interface,
    $vip_address,
    $options
) {

  $vip_filename = "${ucarp::params::config_dir}/vip-${id}.conf"

  file { $vip_filename:
    ensure  => present,
    owner   => root,
    group   => root,
    content => template("${module_name}/vip.conf.erb"),
    notify  => Service[$ucarp::params::service_name]
  }
}
