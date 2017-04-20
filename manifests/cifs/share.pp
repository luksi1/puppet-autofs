#
define autofs::cifs::share (
  $source = undef,
  $destination = undef,
  $domain = undef,
  $uid = undef,
  $gid = undef,
  $credentials = undef,
  $username = undef,
  $password = undef,
  $timeout = 10,
  $file_mode = 0775,
  $dir_mode = 0775,
  $cifs_package_name = 'cifs-utils'

){

  include ::autofs

  validate_string($source)
  validate_string($destination)
  validate_string($domain)
  validate_string($uid)
  validate_string($gid)

  package {'cifs':
    ensure => 'latest',
    name   => $cifs_package_name,
  }

  file {"autofs_${_name}":
    path    => "/etc/auto.master.d/${name}.autofs",
    content => template('autofs/cifs/autofs.erb'),
    notify  => Class['autofs::service'],
    require => Package['cifs']
  }

}
