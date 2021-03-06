# == Class: puppet
#
class puppetnfs::nfs {


    case $facts['networking']['domain'] {
      'servernfs.lan': {
        #file { 'spacedisk':
        #  ensure  => present,
        #  path    => "/data/",
        #  mode    => '0755',
        #  owner   => 'root',
        #  group   => 'root',
        #}
        file_line { 'confnfsserver':
          ensure => present,
          path   => '/etc/exports',
          line   => "/data "{$facts['networking']['ip']}"/24 (rw, sync, no_subtree_check)",
          match  => '^ ',
        }
      }

      'client.lan': {
        file { 'mntnfs':
          ensure  => present,
          path    => "/mnt/data/",
          mode    => '0755',
          owner   => 'root',
          group   => 'root',
        }
        file_line { 'confnfsclient':
          ensure => present,
          path   => '/etc/fstab',
          line   => {$facts['networking']['ip']}":/data    /mnt/data   nfs auto,noatime,nolock,bg,nfsvers=4,intr,tcp,actimeo=1800 0 0
",
          match  => '^ ',
        }
      }


      default: {
        file { 'mntnfs':
          ensure  => present,
          path    => "/mnt/data/",
          mode    => '0755',
          owner   => 'root',
          group   => 'root',
        }
        file_line { 'confnfsclient':
          ensure => present,
          path   => '/etc/fstab',
          line   => {$facts['networking']['ip']}":/data    /mnt/data   nfs auto,noatime,nolock,bg,nfsvers=4,intr,tcp,actimeo=1800 0 0
",
          match  => '^ ',
        }
      }
    }
  }
}
