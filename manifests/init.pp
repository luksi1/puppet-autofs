class autofs (
  $auto_master_d    = $autofs::params::auto_master_d,
  $autofs_package   = $autofs::params::autofs_package,
  $require_packages = $autofs::params::require_packages,
  $autofs_service   = $autofs::params::autofs_service,
  $notify_services  = $autofs::params::notify_services,
  $service_provider = $autofs::params::service_provider
) inherits autofs::params {

  validate_absolute_path($auto_master_d)
  validate_string($autofs_package)
  validate_string($autofs_service)

  anchor{'autofs::begin':} ->
  class{'::autofs::install':} ->
  class{'::autofs::config':} ~>
  class{'::autofs::service':} ->
  anchor{'::autofs::end':}
  
}
