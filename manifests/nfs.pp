# == Class: puppet
#
class puppetnfs::nfs {

$direccionip = $facts['networking']['ip']
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
          line   => "/data ${direccionip}/24 (rw, sync, no_subtree_check)",
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
          line   => "${direccionip}:/data    /mnt/data   nfs auto,noatime,nolock,bg,nfsvers=4,intr,tcp,actimeo=1800 0 0
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
          line   => "${direccionip}:/data    /mnt/data   nfs auto,noatime,nolock,bg,nfsvers=4,intr,tcp,actimeo=1800 0 0
",
          match  => '^/data {{lsbdistid => Debian, lsbdistdescription => Debian GNU/Linux 10 (buster), lsbdistcodename => buster, os => {architecture => amd64, dist$
SSHFP 1 2 0ed3512cde6f025b1c648938f3160069b97dfd1be71abcf6b3dc8f9364ff0042, sshfp_ecdsa => SSHFP 3 1 04a91a3cfee9bfc824eaa5c3501dd676e3cec668
SSHFP 3 2 d92e40e4e80cabfe6ee516559a02ee18e556c8642b7943091984a7b7875d0a1f, sshfp_ed25519 => SSHFP 4 1 8fdc5c228f76769499babeb8545929c93ff5628f
SSHFP 4 2 2b352deb3cd9a24ff3c44a2f5d6e5b9a79c805c1e0eb3b14760d2c52c19b0975, kernelversion => 4.19.0, is_virtual => true, system_uptime => {sec$


',
        }
      }
    }
  }
}
