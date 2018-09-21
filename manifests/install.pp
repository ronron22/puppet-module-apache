class apache::install (

	$apache_packages	= [ 'apache2', 'apache2-bin', 'apache2-data', 'apache2-dev', 'apache2-utils', 'libapache2-mod-rpaf' ],
	$enable						= $::apache::params::enable,
	$nodename					= hiera('nodename')

	) inherits apache {

		if $enable {
			$apache_packages.each |String $package|{
				package { "${package}":
				ensure  =>  installed,

			}
		}
	}
}
