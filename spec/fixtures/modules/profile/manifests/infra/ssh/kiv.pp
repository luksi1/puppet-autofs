class profile::infra::ssh::kiv {
  
  $kiv_root = hiera('ssh_key_kiv_root')
  $jatra1   = hiera('ssh_key_jatra1')
  $kenju3   = hiera('ssh_key_kenju3')
  $adach1   = hiera('ssh_key_adach1')

  $kiv = merge($kiv_root, $jatra1, $kenju3, $adach1)
  create_resources('ssh_authorized_key', $kiv)

}	
