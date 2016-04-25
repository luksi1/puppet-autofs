class profile::software::www::apache::prm {
  cron { "prm_rpm":
    command => "cd /var/www/html/; /usr/local/bin/prm --type rpm --path pool --release centos6,centos7 --component stable --arch x86_64 --gpg vgrit --directory /packages",
    hour    => 1,
    minute  => 0,
    user    => root,
  }

  cron { "prm_deb":
    command => "cd /var/www/html/; /usr/local/bin/prm --type deb --path pool --component stable --release trusty,precise --arch amd64,i386 --gpg vgrit --directory /packages",
    hour    => 2,
    minute  => 0,
    user    => root,
  }
}
