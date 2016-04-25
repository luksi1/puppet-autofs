define autofs (
  $auto_master_d = $::params::auto_master_d,
  $timeout = $::params::timeout,
  $name,
  $source,
  $destination,
  $options
) inherits autofs::params {

}
