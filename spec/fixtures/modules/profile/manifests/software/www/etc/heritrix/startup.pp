class profile::software::www::etc::heritrix::startup {
	
	rclocal::script { "zpool_import":
		priority => "1",
		content  => "zpool import zfs\n",
	}
	rclocal::script { "apache2_restart":
		priority => "2",
		content => "/etc/init.d/apache2 restart\n",
	}

}
