class profile::infra::ssh::java_developers {

  $clalu4 = hiera('ssh_key_clalu4')
  $patrik_bjork = hiera('ssh_key_patrik_bjork')

  $java_developers = merge(
	$clalu4,
	$patrik_bjork
  )
  create_resources('ssh_authorized_key', $java_developers)
}
