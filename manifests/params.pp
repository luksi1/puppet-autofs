class autofs::params {

  case $::operatingsystem {
    'Ubuntu': {
      case $::lsbdistrelease {
        '16.04': {
          $service_provider = 'systemd'
        }
        default: {
          $service_provider = undef
        }
      }

      $auto_master_d = '/etc/auto.master.d'
      $autofs_package = "autofs"
      $autofs_service = "autofs"
      $notify_services = Service[$autofs_service]
      $require_packages = Package[$autofs_package]

    }
    default: {
      fail{'Your operating system is not supported':}
    }
  }
}
