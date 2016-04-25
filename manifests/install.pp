class autofs::install {

  package {"autofs-package":
    ensure => 'installed',
  }

  service {"autofs-service":
    ensure => "running",
    require => ["autofs-package"]
  }

}
