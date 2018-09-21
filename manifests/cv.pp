class apache::cv (
	$nodename = hiera('nodename'),
	) {
	file { '/var/www/html/antonio/cv/antonio-cv.pdf':
		ensure    => present,
		owner     => antonio,
		group     => antonio,
		mode      => '0644',
		content   => file("apache/${nodename}/var/www/html/antonio/cv/antonio-cv.pdf"),
	}
}