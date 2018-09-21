class apache {
	include apache::install
	include apache::config
	include apache::modules
	include apache::vhosts
	include apache::service
	Class['apache::install'] ~> Class['apache::modules'] ~> Class['apache::config'] ~> Class['apache::vhosts'] ~> Class['apache::service']
}
