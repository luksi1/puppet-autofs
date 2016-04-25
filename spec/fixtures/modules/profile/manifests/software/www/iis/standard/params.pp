class profile::software::www::iis::standard {
  
    $windows_features = hiera('profile::software::www::iis::standard::windows_features')
    $group = hiera('profile::software::www::iis::standard::group')
    $rnetserv1folder = hiera('profile::software::www::iis::standard::rnetserv1folder')
    $netservUmask = hiera('windows_umask_synchronize') + hiera('windows_umask_readandexecute')
    $web_site = hiera_array('profile::software::www::iis::standard::web_site')
   
}