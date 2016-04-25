class profile::software::infra::standard::snow {
  case $::operatingsystem {
    "Ubuntu" : {
      package { 'xclientsios': ensure => latest, }

    }

    /RedHat|CentOS/ : {
      package { 'xClientSIOS': ensure => latest, }

    }
  }

}
