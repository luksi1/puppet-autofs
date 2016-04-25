class profile::infra::ssh::alfresco {
	
	$alfresco = merge(
		hiera('ssh_key_nikek3'),
		hiera('ssh_key_clalu4'),
		hiera('ssh_key_marsv157'),
	)
	create_resources('ssh_authorized_key', $alfresco)

}
