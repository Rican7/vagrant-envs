# Nginx puppet configuration

# The Nginx user
user { 'nginx':
    ensure  => present,
    system  => true,
    home    => '/var/cache/nginx',
    shell   => '/sbin/nologin',
    comment => 'Nginx webserver user',
    groups  => ['webserver'],
    require => Group['webserver'],
}

# Main config
class { 'nginx': }

# Nginx virtual hosts
nginx::resource::vhost { 'app.dev':
    www_root => '/vagrant/',
}
