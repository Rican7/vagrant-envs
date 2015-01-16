# Puppet configuration

Package {
    # Fix for deprecation notice with Yum
    # (see https://inuits.eu/blog/puppet-361-depreciation-warning)
    allow_virtual => true,
}

# PHP install configuration
class { 'php':
    service             => 'php-fpm',
    service_autorestart => true,
}

# PHP modules
php::module { 'fpm': }
php::module { 'opcache': }
php::module { 'pdo': }
php::module { 'pgsql': }
php::module { 'mbstring': }
php::module { 'mcrypt': }
php::module { 'bcmath': }
php::module { 'gmp': }

# PHP-FPM service
service { 'php-fpm':
    ensure => running,
}

# Nginx
class { 'nginx': }

# Nginx virtual hosts
nginx::resource::vhost { 'appnamehere.pls':
    www_root => '/vagrant/',
}
