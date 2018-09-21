class apache::install (

	$apache_packages	= hiera('apache_packages'),
	$enable						= hier('enable'),

	) inherits apache {
		$apache_packages.each |String $package|{
			package { "${package}":
			ensure  =>  installed,
		}
}
