# Gconf Module init.pp
#
# Computer Action Team
# Maseeh College of Engineering & Computer Science

class gconf {

  case $kernel {
    linux: {
      package { "gconf2":
        ensure => present,
      }
    }
    default: {
      package { "libgconf_dev":
        ensure    => present,
        provider  => "blastwave",
      }
    }
  }
}
