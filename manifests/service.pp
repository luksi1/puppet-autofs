class autofs::service inherits autofs {
  service {$autofs_service:
    ensure   => 'running',
    require  => $autofs_packages,
    provider => $service_provider,
  }
}
