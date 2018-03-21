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
  }

  file {'/testing/puppet/test.txt':
    ensure => absent,
  }

  file {'/testing/puppet/read_only.txt':
    ensure  => file,
    content => 'This is a read only file\n',
    mode    => '0400',
    require => file['/testing/puppet'],
  }

  file {'/testing/puppet/read_write.txt':
    ensure  => file,
    content => 'This is a read only file\n',
    mode    => '0600',
    require => file['/testing/puppet'],
  }

  file {'/testing/puppet/read_wrtie_execute.txt':
    ensure  => file,
    content => 'This is a read only file\n',
    mode    => '0700',
    require => file['/testing/puppet'],
  }
}
