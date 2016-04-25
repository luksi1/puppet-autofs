class profile::infra::users::oc {

  $markl13 = hiera(ssh_key_markl13)
  $valhy1  = hiera(ssh_key_valhy1)
  $filsc1  = hiera(ssh_key_filsc1)

  group { 'oc': ensure => present, }

  user { 'markl13':
    ensure => present,
    gid    => 'oc',
    home   => '/home/markl13',
    shell  => '/bin/bash',
    managehome => true,
  }
  user { 'valhy1':
    ensure => present,
    gid    => 'oc',
    home   => '/home/valhy1',
    shell  => '/bin/bash',
    managehome => true,
  }
  user {'filsc1':
    ensure => present,
    gid    => 'oc',
    home   => '/home/filsc1',
    shell  => '/bin/bash',
    managehome => true,
  }

  $oc = merge(
    $markl13,
    $valhy1,
    $filsc1
  )
  create_resources('ssh_authorized_key', $oc)

  file { '/etc/sudoers.d/oc':
    owner   => "root",
    group   => "root",
    mode    => "440",
    content => join(['%oc  ALL=(ALL:ALL) NOPASSWD: ALL', "\n"]),
  }

}

