class autofs::params {

  $timeout = 60
  case $::osfamily {
    'Debian': {
      $auto_master_d = '/etc/auto.master.d'
      $autofs_package = "autofs"
      $autofs_service = "autofs"
      $notify_services = Service[$autofs_service]
      $require_packages = Package[$autofs_package]
    }
    default: {
      notify{'Your operating system is not supported':}
    }
  }
}
