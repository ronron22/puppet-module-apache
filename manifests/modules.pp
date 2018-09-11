class apache::modules (
        $nodename = hiera('nodename'),
        $apache_mods_enabled = hiera('apache_mods_enabled'),
    ) {
        include apache::services
        $apache_mods_enabled.each |String $mod| {
            file { "/etc/apache2/mods-enabled/${mod}.conf":
                ensure   => link,
                owner    => root,
                group    => root,
                mode     => '0644',
                target   => "/etc/apache2/mods-available/${mod}.conf",
                #notify   => Service['apache2'],
            }
        }
}
