# == Class: puppetNFS
#
class puppetnfs {
  include 'puppetNFS::install'
  include 'puppetNFS:: nfs'
}
