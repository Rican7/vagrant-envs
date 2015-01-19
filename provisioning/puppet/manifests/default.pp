# Puppet configuration

Package {
    # Fix for deprecation notice with Yum
    # (see https://inuits.eu/blog/puppet-361-depreciation-warning)
    allow_virtual => true,
}

$php_application_service = 'php-fpm'
$php_modules = ['opcache', 'pdo', 'pgsql', 'mbstring', 'mcrypt', 'bcmath', 'gmp']

# PHP install configuration
class { 'php':
    package             => 'php-fpm',

    # Re-enable once https://github.com/example42/puppet-php/pull/81 gets merged...
    #install_options     => [{'--enablerepo' => 'remi-php55'}],

    service             => $php_application_service,
    service_autorestart => true,
}

# PHP modules
php::module { $php_modules: }

# PHP-FPM service
service { $php_application_service:
    ensure => running,
}

# Nginx
class { 'nginx': }

# Nginx virtual hosts
nginx::resource::vhost { 'app.dev':
    www_root => '/vagrant/',
}
