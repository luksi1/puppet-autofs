class profile::infra::ssh::maxwell {

	$maxwell = merge(
		hiera('ssh_key_ibcs1'),
		hiera('ssh_key_maxwell'),
		hiera('ssh_key_demoibln1'),
		hiera('ssh_key_demoibln2'),
		hiera('ssh_key_demoibcn'),
	)

	create_resources('ssh_authorized_key', $maxwell)

}	
