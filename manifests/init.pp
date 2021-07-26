# == Class: puppetNFS
#
class puppetnfs {
  include 'puppetnfs::install'
  include 'puppetnfs::nfs'
}
