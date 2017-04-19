class autofs::install inherits autofs {

  package {$autofs_package:
    ensure   => 'installed',
  }
}
