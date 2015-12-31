# == Class: hieraconf
#
# Full description of class hieraconf here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { hieraconf:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class hieraconf {

exec { 'puppet_hiera_yaml':
  creates => '/etc/puppet/hiera.yaml',
  command => 'mv /etc/hiera.yaml /etc/puppet/hiera.yaml; ln -s /etc/puppet/hiera.yaml /etc/hiera.yaml;',
  path    => [ '/bin' ],
}

file { '/etc/puppet/data':
  ensure => directory,
}

file { '/etc/puppet/hiera.yaml':
  ensure  => present,
  require => File[ '/etc/puppet/data' ],
  content => template ('hieraconf/hiera_yaml.erb'),
}

}
