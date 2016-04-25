class autofs (
  $auto_master_d = $::params::auto_master_d,
  $timeout = $::params::timeout,
  $name,
  $source,
  $destination,
  $options
) inherits autofs::params {

  anchor{'autofs::begin':} ->
  class{'::autofs::install ->
  class{'::autofs::config:} ~>
  anchor{'::autofs::end:}
  
}
