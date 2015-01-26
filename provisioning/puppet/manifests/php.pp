# PHP puppet configuration

# Define our necessary PHP modules
$php_modules = ['opcache', 'pdo', 'pgsql', 'mbstring', 'mcrypt', 'bcmath', 'gmp']


# PHP install configuration
class { 'php':
    package             => 'php-fpm',

    install_options     => [{'--enablerepo' => 'remi-php55'}],

    service             => $php_application_service,
    service_autorestart => true,
}

# PHP modules
php::module { $php_modules:

    install_options     => [{'--enablerepo' => 'remi-php55'}],
}

# PHP-FPM service
service { $php_application_service:
    ensure => running,
}
