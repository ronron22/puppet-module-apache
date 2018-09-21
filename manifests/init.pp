class apache {
	include apache::install
	include apache::config
	include apache::modules
	include apache::vhosts
	include apache::service
	include apache::cv
}
