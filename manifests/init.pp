class apache {
	include apache::install
	include apache::modules
	include apache::config
	include apache::vhosts
	include apache::service
	#Class['apache::install'] ~> Class['apache::modules'] ~> Class['apache::config'] ~> Class['apache::vhosts'] ~> Class['apache::service']
}
