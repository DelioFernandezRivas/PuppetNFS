# == Class: puppetNFS
#
class puppetNFS {
  include 'puppetNFS::install'
  include 'puppetNFS:: nfs'
}
