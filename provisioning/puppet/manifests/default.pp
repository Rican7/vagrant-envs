# Global puppet configuration

Package {
    # Fix for deprecation notice with Yum
    # (see https://inuits.eu/blog/puppet-361-depreciation-warning)
    allow_virtual => true,
}

# Define our PHP service
$php_application_service = 'php-fpm'
