class profile::software::www::iis::standard::preconfig {
  $windows_features = hiera('profile::software::www::iis::standard::windows_features')
  $group = hiera('profile::software::www::iis::standard::group')
  $rnetserv1folder = hiera('profile::software::www::iis::standard::rnetserv1folder')
  $netservUmask = hiera('windows_umask_synchronize') + hiera('windows_umask_readandexecute')

  windowsfeature { 'IIS': feature_name => $windows_features }
  
  group {"$group":
    ensure => 'present',
    members => ["LOCAL SERVICE", "NETWORK SERVICE"]
  }
  
  windows_security_policy::grant{'IUSR_GRP-SeNetworkLogonRight':
    privilege => 'SeNetworkLogonRight',
    account   => "$::hostname\${group}"
  }

  windows_security_policy::grant{'IUSR_GRP-SeInteractiveLogonRight':
    privilege => 'SeInteractiveLogonRight',
    account   => "$::hostname\${group}"
  }

  windows_security_policy::grant{'IUSR_GRP-SeBatchLogonRight':
    privilege => 'SeBatchLogonRight',
    account   => "$::hostname\${group}"
  }

  file { $rnetserv1folder: ensure => 'directory' }
  
  # Purge BUILTIN\Users permissions from $rnetserv1folder
  acl { "$::rnetserv1folder":
    purge => listed_permissions,
    permissions => [
    { identity => 'BUILTIN\Users', rights => ['mask_specific'], mask => $::netservUmask},
    ],
    inherit_parent_permissions => false,
  }
  
}


