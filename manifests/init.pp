class apache {
	include apache::install
	include apache::modules
	include apache::config
	include apache::vhosts
	include apache::service
}
