class odbc::params {
  case $::osfamily {
    'RedHat': {
      $unixodbc_pkg = 'unixODBC'
      $mysql_pkg = 'mysql-connector-odbc'
      $mysql_libname = 'libmyodbc3.so'
      $mysql_libpath = $::architecture ? {
        'x86_64' => '/usr/lib64',
        default  => '/usr/lib',
      }
      $pgsql_pkg = 'postgresql-odbc'
    }

    'Debian': {
      $unixodbc_pkg = 'unixodbc'
      $mysql_pkg = 'libmyodbc'
      $mysql_libname = 'libmyodbc.so'
      $mysql_libpath = '/usr/lib/odbc'
      $pgsql_pkg = 'odbc-postgresql'
    }

    'Suse': {
      $unixodbc_pkg = 'unixODBC'
      $mysql_pkg   = 'MyODBC-unixODBC'
      $mysql_libname = 'libmyodbc3.so'
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
