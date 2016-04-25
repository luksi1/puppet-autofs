class profile::software::infra::standard::tsm {
  $octet1 = regsubst($ipaddress, '^(\d+)\.(\d+)\.(\d+)\.(\d+)', '\1')
  $octet2 = regsubst($ipaddress, '^(\d+)\.(\d+)\.(\d+)\.(\d+)', '\1.\2')
  $octet3 = regsubst($ipaddress, '^(\d+)\.(\d+)\.(\d+)\.(\d+)', '\1.\2.\3')

  if $octet2 == '140.166' {
    $geo = 'GBG'
  } elsif $octet2 == '138.233' {
    $geo = "SKO"
  } elsif $octet2 == '10.51' {
    $geo = "GBG"
  } elsif $octet2 == '146.21' {
    $geo = "GBG"
  }

  if ($geo == undef) {
    $geo = hiera('geo')
  }

  

  case $::operatingsystem {
    "Ubuntu" : {
      package { 'gskcrypt64': ensure => latest, }

      package { 'gskssl64': ensure => latest, }

      package { 'tivsm-ba': ensure => latest, }

      package { 'tivsm-api64': ensure => latest, }

      file { "/etc/init.d/dsmc":
        owner   => root,
        group   => root,
        mode    => "755",
        content => template("profile/dsmc.deb.erb"),
        notify  => Service['dsmc'],
      }

      case $::lsbmajdistrelease {
        "12.04" : {
          file { "/etc/init/dsmc.conf":
            owner   => root,
            group   => root,
            mode    => "644",
            content => template("profile/dsmc.conf.erb"),
            notify  => Service['dsmc'],
          }

        }

        "14.04" : {
          file { "/etc/init/dsmc.conf":
            owner   => root,
            group   => root,
            mode    => "644",
            content => template("profile/dsmc.conf.erb"),
            notify  => Service['dsmc'],
          }

        }
      }

    }

    "RedHat" : {
      package { 'gskcrypt64': ensure => latest, }

      package { 'gskssl64': ensure => latest, }

      package { 'TIVsm-API64': ensure => latest, }

      package { 'TIVsm-BA': ensure => latest, }

      case $::lsbmajdistrelease {
        "6" : {
          file { "/etc/init/dsmc.conf":
            owner   => root,
            group   => root,
            mode    => "644",
            content => template("profile/dsmc.conf.erb"),
            notify  => Service['dsmc'],
          }

          file { "/etc/init.d/dsmc":
            owner   => root,
            group   => root,
            mode    => "755",
            content => template("profile/dsmc.rh.erb"),
            notify  => Service['dsmc'],
          }

        }
      }

    }

  }

  file { "/opt/tivoli/tsm/client/ba/bin/dsm.sys":
    owner   => root,
    group   => root,
    mode    => "644",
    content => template('profile/dsm.sys.erb'),
  }

  file { "/opt/tivoli/tsm/client/ba/bin/inexclude_file":
    ensure => present,
    owner  => root,
    group  => root,
    mode   => "644",
    notify => Service['dsmc'],
  }

  file { "/opt/tivoli/tsm/client/ba/bin/dsm.opt":
    owner   => root,
    group   => root,
    mode    => "644",
    content => template('profile/dsm.opt.erb'),
    notify  => Service['dsmc'],
  }

  file { '/var/log/tsm':
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => "777",
  }

  file { '/var/log/tsm/err.log':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => "777",
  }

  file { '/var/log/tsm/sch.log':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => "777",
  }

  service { 'dsmc':
    name   => 'dsmc',
    ensure => false,
    enable => false,
  }

  service { 'dsmcad':
    name   => 'dsmcad',
    ensure => true,
    enable => true,
  }

}
