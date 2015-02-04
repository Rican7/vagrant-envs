#!/usr/bin/env bash

#############################
## Additional Repo Install ##
#############################

# Download and enable the EPEL repo
rpm -ivh https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Download the Remi repo (http://rpms.famillecollet.com/)
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

# Enable the Remi base "remi" repo to be queried by default
yum-config-manager --enable remi



##############################
## Base OS-level operations ##
##############################

# Update core packages via Yum
yum -y update

# Install some packages
yum -y install \
    yum-utils \
    scl-utils \
    git \
    gcc \
    kernel-devel \
    openssl-devel \
    ruby \
    ruby-devel \
    rubygems

# Temporarily disable SELinux
# Some of the gem/bundle installs fail with SELinux in enforce mode
setenforce 0



####################
## Puppet Install ##
####################

# Install bundler
gem install bundler

# Install our gems
(cd /vagrant/provisioning && exec bundle install)

# Install our puppet modules
(cd /vagrant/provisioning/puppet && exec librarian-puppet install)
