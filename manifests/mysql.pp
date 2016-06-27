# == Class: odbc::mysql
#
# Installs the MySQL ODBC drivers
#
class odbc::mysql {

  include ::odbc

  package { 'mysql-odbc':
    ensure => present,
    name   => $::odbc::params::mysql_pkg,
  }

  $libpath     = $::odbc::params::mysql_libpath
  $libname     = $::odbc::params::mysql_libname
  $setupname   = $::odbc::params::mysql_setupname
  $config_root = $::odbc::params::odbc_config_root

  augeas { 'mysql odbc driver config':
    lens    => 'Odbc.lns',
    incl    => "${config_root}/odbcinst.ini",
    changes => [
      "set MySQL/Description 'ODBC for MySQL'",
      "set MySQL/Driver ${libpath}/${libname}",
      "set MySQL/Setup ${libpath}/${setupname}",
      'set MySQL/FileUsage 1',
    ],
    require => Package['mysql-odbc'],
  }
}
