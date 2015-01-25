#!/usr/bin/env bash

##############################
## Base OS-level operations ##
##############################

# Update core packages via Yum
yum -y update

# Install `yum-utils` and `scl-utils`
yum -y install yum-utils scl-utils



##################
## Ruby Install ##
##################

# Install the Ruby software-collections repo package
# Download and enable the Ruby software-collections repo
rpm -ivh https://www.softwarecollections.org/en/scls/rhscl/ruby193/epel-6-x86_64/download/rhscl-ruby193-epel-6-x86_64.noarch.rpm

# Install ruby via Yum
yum -y install ruby193-ruby

# Run a new bash instance with the new ruby version
scl enable ruby193 bash



####################
## Puppet Install ##
####################

# Download and enable the Puppet Labs repo
rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm

# Install puppet via Yum
yum -y install puppet



#############################
## Additional Repo Install ##
#############################

# Download and enable the EPEL repo
rpm -ivh https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Download the Remi repo (http://rpms.famillecollet.com/)
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

# Enable the Remi base "remi" repo to be queried by default
yum-config-manager --enable remi
#yum-config-manager --enable remi-php55 # PHP 5.5
#yum-config-manager --enable remi-php56 # PHP 5.6
