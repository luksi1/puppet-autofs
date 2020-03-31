#
class autofs::install {

    package {$::autofs::autofs_package:
      ensure   => 'installed',
    }
}
