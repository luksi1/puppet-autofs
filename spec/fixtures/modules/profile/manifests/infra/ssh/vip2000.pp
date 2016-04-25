class profile::infra::ssh::vip2000 {

	$vip2000 = merge(
		hiera('ssh_key_magnus_dahl'),
		hiera('ssh_key_olof_johansson'),
		hiera('ssh_key_erik_bentzer'),
		hiera('ssh_key_eric_torsson'),
	)

	create_resources('ssh_authorized_key', $vip2000)

}	
