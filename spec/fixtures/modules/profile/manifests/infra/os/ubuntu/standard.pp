class profile::infra::os::ubuntu::standard {
  case $::operatingsystem {
    "Ubuntu" : {
      case $::is_virtual {
        "true" : {
          package { 'open-vm-tools': ensure => latest, }
        }
      }

      package { 'gnupg': ensure => installed, }

      class { 'apt':
        update => {
          frequency => 'daily',
        }
        ,
      }

      package { 'update-manager-core': ensure => installed, }

      package { 'uptimed': ensure => installed, }

    }

  }
}
