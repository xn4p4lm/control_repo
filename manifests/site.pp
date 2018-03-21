node default {
  file {'/root/README':
    ensure  => file,
    content => 'This is a readme, puppet placed me here\n',
  }
}

node 'puppet-v5-test' {
  file{'/testing':
    ensure => 'directory',
    owner  => 'root',
    mode   => '0600',
    before => File['/testing/puppet'],
  }

  file {'/testing/puppet':
    ensure => 'directory',
    owner  => 'root',
    mode   => '0600',
    before => File['/testing/puppet/test.txt'],
  }

  file {'/testing/puppet/test.txt':
    ensure  => file,
    content => 'This is a readme, puppet placed me here. This is the Testing server only\n',
    mode    => '0400',
  }
}
