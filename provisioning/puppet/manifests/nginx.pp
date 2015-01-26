# Nginx puppet configuration

# Main config
class { 'nginx': }

# Nginx virtual hosts
nginx::resource::vhost { 'app.dev':
    www_root => '/vagrant/',
}

