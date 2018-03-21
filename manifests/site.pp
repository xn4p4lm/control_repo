node default {
  file {'/root/README':
    ensure  => file,
    content => 'This is a readme, puppet placed me here\n',
  }
}

node 'puppet-v5-test' {
  file {'/testing/puppet/':
    ensure => 'directory',
    owner  => 'root',
    mode   => '0600',
  }
}
