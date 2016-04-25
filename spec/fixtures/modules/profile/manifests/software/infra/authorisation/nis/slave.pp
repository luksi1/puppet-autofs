class profile::software::infra::authorisation::nis::slave {

	# True = master
	# False = slave
	$master = hiera('profile::software::infra::authorisation::nis::master')
	$ypdomain = hiera('profile::software::infra::authorisation::nis::ypdomain')
	$ypserv = hiera('profile::software::infra::authorisation::nis::ypserv')
	$ypmaster = hiera('profile::software::infra::authorisation::nis::ypmaster')

	class{'nis':
		ypdomain => $ypdomain,
		ypmaster => $ypmaster,
		master => $master,
                server => true,
		client => false,
		ypserv => $ypserv,
	}


}	
