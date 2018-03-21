node default {
  file {'/root/README':
    ensure  => file,
    content => 'This is a readme, puppet placed me here\n',
  }
}

node 'puppet-v5-test' {
  directory {'/testing/puppet/':
    ensure => present,
  }
}
