node puppet {
  file { '/root/README':
   ensure => file,
  }
}
