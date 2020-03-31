#
class autofs::service {
  service {$::autofs::autofs_service:
    ensure  => 'running',
    require => Package[$::autofs::autofs_package],
  }
}
