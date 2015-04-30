define ucarp::vip (
    $id,
    $password,
    $bind_interface,
    $vip_interface,
    $options
) {

  $vip_filename = "${ucarp::params::config_dir}/vip-${id}.conf"

  file { $vip_filename:
    ensure  => present,
    owner   => root,
    group   => root,
    content => template("${module_name}/vip.conf.erb")
  }
}
