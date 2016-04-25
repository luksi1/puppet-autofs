class profile::infra::ssh::unix_staff {  

  $luksi1  = hiera('ssh_key_luksi1')
  $magjo10 = hiera('ssh_key_magjo10')
  $marha41 = hiera('ssh_key_marha41')
  $danst7  = hiera('ssh_key_danst7')
  $danju1  = hiera('ssh_key_danju1')
  $jonan4  = hiera('ssh_key_jonan4')
  $hayal2  = hiera('ssh_key_hayal2')
  $chrny3  = hiera('ssh_key_chrny3')

  $unix_staff = merge (
    $luksi1, $magjo10, $marha41, $danst7, $danju1, $jonan4, $hayal2, $chrny3
  )

  create_resources('ssh_authorized_key', $unix_staff)

}

