# Gconf Module init.pp
#
# Computer Action Team
# Maseeh College of Engineering & Computer Science

class gconf {

  case $::kernel {
    linux: {
      package { "gconf2":
        ensure => present,
        name   => $::osfamily ? {
          'RedHat' => 'GConf2',
          default  => 'gconf2',
        }
      }
    }
    default: {
      package { "libgconf_dev":
        ensure    => present,
        provider  => "pkgutil",
      }
    }
  }
}
