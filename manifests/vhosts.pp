class apache::vhosts (

	$nodename							= hiera('nodename'),
	$apache_sites_enabled = hiera('apache_sites_enabled'),

	) inherits apache {
		$apache_sites_enabled.each |String $site| {
			file { "/etc/apache2/sites-enabled/${site}.conf":
				ensure   => link,
				owner    => root,
				group    => root,
				mode     => '0644',
				target   => "/etc/apache2/sites-available/${site}.conf",
				#notify   => Service['apache2'],
			}
	}
}
