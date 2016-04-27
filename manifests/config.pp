class autofs::config inherits autofs {

  file {"$autofs::auto_master_d": 
    ensure => 'directory',
  }

  file {"${autofs::auto_master_d}/${autofs::autofs_share_name}":
    ensure => 'file',
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
    content => template("autofs/autofs.erb"),
    notify  => $autofs::notify_services,
  }
}
