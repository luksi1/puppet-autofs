class profile::software::infra::authorisation::nis::master {

	# True = master
	# False = slave
	$master = hiera('profile::software::infra::authorisation::nis::master')
	$ypdomain = hiera('profile::software::infra::authorisation::nis::ypdomain')
	$ypserv = hiera('profile::software::infra::authorisation::nis::ypserv')
	$ypmaster = hiera('profile::software::infra::authorisation::nis::ypmaster')
	$makefile_yppwddir = hiera('profile::software::infra::authorisation::nis::makefile_yppwddir')
	$makefile_nopush = hiera('profile::software::infra::authorisation::nis::makefile_nopush')
	$makefile_all = hiera('profile::software::infra::authorisation::nis::makefile_all')

	class{'nis':
		ypdomain => $ypdomain,
		ypmaster => $ypmaster,
		master => $master,
                server => true,
		client => false,
		ypserv => $ypserv,
		makefile_yppwddir => $makefile_yppwddir,
		makefile_all => $makefile_all,
                makefile_nopush => $makefile_nopush
	}


}	
