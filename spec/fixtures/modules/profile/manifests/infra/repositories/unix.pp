class profile::infra::repositories::unix {
  case $::operatingsystem {
    "RedHat" : {
      case $::lsbmajdistrelease {
        "6" : {
          yumrepo { 'vgrit':
            enabled  => 1,
            descr    => 'VGR IT package repo',
            baseurl  => 'http://repo.vgregion.se/centos6/x86_64',
            gpgcheck => 0,
          }
        }

        "7" : {
          yumrepo { 'vgrit':
            enabled  => 1,
            descr    => 'VGR IT package repo',
            baseurl  => 'http://repo.vgregion.se/centos7/x86_64',
            gpgcheck => 0,
          }
        }
      }
    }

    "Ubuntu" : {
      apt::key { '1C4BF2B7E438859F981624BD542ADFA15ED78BBE':
        ensure => present,
        key_source => "http://repo.vgregion.se/vgrit.key",
      }

      case $::lsbdistrelease {
        "14.04" : {
          apt::source { "vgrit":
            location    => "http://repo.vgregion.se",
            release     => "trusty",
            include_src => false,
            repos       => stable
          }
        }

        "12.04" : {
          apt::source { "vgrit":
            location    => "http://repo.vgregion.se",
            release     => "precise",
            include_src => false,
            repos       => stable
          }
        }
      }
    }

  }
}
