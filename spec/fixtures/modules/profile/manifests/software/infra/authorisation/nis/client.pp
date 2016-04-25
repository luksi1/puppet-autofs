class profile::software::infra::authorisation::nis::client {

	# True = master
	# False = slave
	$ypdomain = hiera('profile::software::infra::authorisation::nis::ypdomain')
	$ypserv = hiera('profile::software::infra::authorisation::nis::ypserv')

	class{'nis':
		ypdomain => $ypdomain,
                server => false,
		client => true,
		ypserv => $ypserv,
	}


}	
