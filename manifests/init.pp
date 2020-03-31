#
class autofs (
  Optional[String] $auto_master_d,
  Optional[String] $autofs_package,
  Optional[String] $autofs_service,
) {

  contain autofs::install
  contain autofs::config
  contain autofs::service

  Class['::autofs::install']
  -> Class['::autofs::config']
  ~> Class['::autofs::service']

}
