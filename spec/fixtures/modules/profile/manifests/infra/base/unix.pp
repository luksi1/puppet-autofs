class profile::infra::base::unix {
  # Deprecated
  cron { "vmware": ensure => absent, }
  cron { "update": ensure => absent, }

  include profile::infra::repositories::unix
  include scom
  include profile::infra::ssh::unix_staff
  include profile::infra::users::oc
  #include profile::software::infra::standard::puppet
  include profile::software::infra::standard::tsm
  include profile::software::infra::standard::snow
  include profile::infra::os::ubuntu::standard

  package { 'screen': ensure => installed, }

  file { '/root/.selected_editor':
    owner   => root,
    group   => root,
    mode    => '660',
    content => "SELECTED_EDITOR=\"/usr/bin/vim.basic\"\n",
  }
}
