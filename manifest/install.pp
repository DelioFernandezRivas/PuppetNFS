# == Class: puppetNFS::install
#
class puppetNFS::install {

  case $facts['networking']['domain'] {
    'servernfs.lan': {
      package { 'installnfs':
        name   => 'nfs-kernel-server'
        ensure => installed,
      }
    }

    'client.lan': {
      package { 'installnfsclient':
        name   => 'nfs-common'
        ensure => installed,
      }
    }


    default: {
      package { 'installnfs':
        name   => 'nfs-kernel-server'
        ensure => installed,
      }
    }
  }
}
