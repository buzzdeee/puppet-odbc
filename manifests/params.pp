class odbc::params {
  case $::osfamily {
    'RedHat': {
      $odbc_config_root = '/etc'
      $unixodbc_pkg = 'unixODBC'
      $mysql_pkg = 'mysql-connector-odbc'
      $mysql_libname = 'libmyodbc3.so'
      $mysql_setupname = 'libmyodbcS.so'
      $mysql_libpath = $::architecture ? {
        'x86_64' => '/usr/lib64',
        default  => '/usr/lib',
      }
      $pgsql_pkg = 'postgresql-odbc'
    }

    'Debian': {
      $odbc_config_root = '/etc'
      $unixodbc_pkg = 'unixodbc'
      $mysql_pkg = 'libmyodbc'
      $mysql_libname = 'libmyodbc.so'
      $mysql_setupname = 'libmyodbcS.so'
      $mysql_libpath = '/usr/lib/odbc'
      $pgsql_pkg = 'odbc-postgresql'
    }

    'Suse': {
      $odbc_config_root = '/etc/unixODBC'
      $unixodbc_pkg = 'unixODBC'
      $mysql_pkg   = 'MyODBC-unixODBC'
      $mysql_libname = 'libmyodbc3.so'
      $mysql_setupname = 'libmyodbc3S.so'
      $mysql_libpath = $::architecture ? {
        'x86_64' => '/usr/lib64',
        default  => '/usr/lib',
      }
      $pgsql_pkg = 'psqlODBC'
    }

    default: {
      fail "Unsupported OS family ${::osfamily}"
    }
  }
}
