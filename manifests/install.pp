class apache::install (

	$apache_packages	= hiera('apache_packages')

	) inherits apache {

		if $enable {
			$apache_packages.each |String $package|{
				package { "${package}":
				ensure  =>  installed,

			}
		}
	}
}
