class profile::infra::base::standard {
  case $kernel {
    'Linux': { include profile::infra::base::unix }
    'Windows': { include profile::infra::base::windows }
  }
}
