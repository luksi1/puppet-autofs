#
define autofs::cifs::share (
  String $source,
  String $destination,
  String $domain,
  String $uid,
  String $gid,
  Optional[String] $credentials       = undef,
  Optional[String] $username          = undef,
  Optional[String] $password          = undef,
  Optional[Integer] $timeout          = 10,
  Optional[String] $file_mode         = '0775',
  Optional[String] $dir_mode          = '0775',
  Optional[String] $cifs_package_name = 'cifs-utils'
) {

  include ::autofs

  package {'cifs':
    ensure => 'latest',
    name   => $cifs_package_name,
  }

  file {"/etc/auto.master.d/${title}.autofs":
    ensure  => 'present',
    content => "/- /etc/${title} --timeout ${timeout}",
    notify  => Class['autofs::service'],
  }

  file {"autofs_${title}":
    path    => "/etc/${title}",
    content => template('autofs/cifs/autofs.erb'),
    notify  => Class['autofs::service'],
    require => Package['cifs'],
  }
}
