class profile::software::infra::standard::puppet {

  $env = hiera('environment')

  class {'puppet':
        conf_dir => '/etc/puppetlabs/puppet',
        ssl_dir  => '/etc/puppetlabs/puppet/ssl',
 	agent => 'running',
	puppet_package => 'puppet-agent',
	server => 'puppet.vgregion.se',
	environment => $env
  }

}
