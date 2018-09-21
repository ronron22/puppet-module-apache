class apache::services (
    $enable = ::apache::params::enable,
    ) {
    service { 'apache2':
      ensure  => running,
      enable  => true,
      restart => 'apache2ctl -t && systemctl reload apache2',
      require => File['/etc/apache2/apache2.conf'],
    }
}
