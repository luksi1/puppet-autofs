#
class autofs::config inherits autofs {

  file {$::autofs::auto_master_d:
    ensure => 'directory',
  }

  file_line { "autofs_${title}_master":
    path    => '/etc/auto.master',
    line    => '+dir:/etc/auto.master.d',
    require => Package['autofs'],
    notify  => Service['autofs'],
  }
}
