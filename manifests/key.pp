# Gconf Module gconf.pp
#
# Computer Action Team
# Maseeh College of Engineering & Computer Science
#
# Creates a gconf type to easily set gconf key/values

define gconf::key($type, $value, $configsource) {

  include gconf

  exec { "gconf: set $name to $type:$value in $configsource":
    path    => "/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin",
    command => "gconftool-2 --direct --config-source $configsource --type $type --set $name '$value'",
    # Command is only run if gconf is present, as is checked by the existence
    # of gconftool-2, and the key is incorrectly set.
    onlyif  => "which gconftool-2 && test x\"`gconftool-2 --config-source $configsource --get $name --direct`\" != 'x$value'"
  }
}
