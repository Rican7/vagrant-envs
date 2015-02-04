# Redis puppet configuration

# The Redis user
user { 'redis':
    ensure  => present,
    system  => true,
    home    => '/var/redis',
    shell   => '/sbin/nologin',
    comment => 'Redis database user',
    groups  => ['webserver'],
    require => Group['webserver'],
}

# Main config
class { 'redis':
    redis_port     => 6379,
    redis_user     => 'redis',
    redis_password => '442b718c48acdf96038b8e477296f6ee',
}
