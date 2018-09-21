class apache::config (

	$enable								= $::apache::params::enable,
	$stopped							= $::apache::params::stopped,
	$nodename							= hiera('nodename'),
	$apache_conf_enabled	= hiera('apache_conf_enabled'),

	) inherits apache {

		file { '/etc/apache2/apache2.conf':
			ensure  => present,
			content => file("apache/${nodename}/etc/apache2/apache2.conf"),
		}

		file { "/etc/apache2":
			ensure => present,
			sourceselect => all,
			source => ["puppet:///modules/apache/${nodename}/etc/apache2","/etc/apache2 "],
			recurse => true,
			#notify   => Service['apache2'],  
		}

		file { "/etc/apache2/mods-enabled", :
			ensure => 'directory',
		}

		file { "/etc/apache2/conf-enabled", :
			ensure => 'directory',
		}

		$apache_conf_enabled.each |String $conf| {
		file { "/etc/apache2/conf-enabled/${conf}":
			ensure   => link,
			owner    => root,
			group    => root,
			mode     => '0644',
			target   => "/etc/apache2/conf-available/${conf}",
			#notify   => Service['apache2'],
		}
	}
}
