# PHP puppet configuration

# Define our necessary PHP modules
$php_modules = ['opcache', 'pdo', 'pgsql', 'mbstring', 'mcrypt', 'bcmath', 'gmp']
$php_install_options = [{'--enablerepo' => 'remi-php55'}]


# PHP install configuration
class { 'php':
    package             => 'php-fpm',

    install_options     => $php_install_options,

    service             => $php_application_service,
    service_autorestart => true,

    template           => "/vagrant/provisioning/puppet/conf/php.ini.erb",
    options            => {
        expose_php     => "Off",
        display_errors => "Off",
    },
}

# PHP modules
php::module { $php_modules:
    install_options     => $php_install_options,
}

# PHP-FPM service
service { $php_application_service:
    ensure => running,
}
