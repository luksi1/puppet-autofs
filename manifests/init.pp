class autofs (
  $auto_master_d    = $autofs::params::auto_master_d,
  $timeout          = $autofs::params::timeout,
  $autofs_package   = $autofs::params::autofs_package,
  $require_packages = $autofs::params::require_packages,
  $autofs_service   = $autofs::params::autofs_service,
  $notify_services  = $autofs::params::notify_services,
  $autofs_share_name,
  $autofs_shares
) inherits autofs::params {

  validate_absolute_path($auto_master_d);
  validate_numeric($timeout);
  validate_string($autofs_package);
  validate_string($autofs_service);
  #validate_hash($notify_services);
  #validate_hash($require_packages);
  validate_string($autofs_share_name);
  validate_array($autofs_shares);

  anchor{'autofs::begin':} ->
  class{'::autofs::install':} ->
  class{'::autofs::config':} ~>
  class{'::autofs::service':} ->
  anchor{'::autofs::end':}
  
}
