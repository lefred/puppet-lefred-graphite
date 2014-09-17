class graphite::config {

   $graphite_db_name     = $graphite::graphite_db_name
   $graphite_db_engine   = $graphite::graphite_db_engine
   $graphite_db_user     = $graphite::graphite_db_user
   $graphite_db_password = $graphite::graphite_db_password
   $graphite_db_host     = $graphite::graphite_db_host
   $graphite_db_port     = $graphite::graphite_db_port

   case $::osfamily {
          'RedHat': {
                $graphite_conf_file    = "/etc/graphite-web/local_settings.py"
                $graphite_apache_file  = "/etc/httpd/conf.d/graphite-web.conf"
                $graphite_cmd          = "/usr/lib/python2.6/site-packages/graphite/manage.py"
          }
          'Debian': {
                $graphite_conf_file    = "/etc/graphite/local_settings.py"
                $graphite_apache_file  = "/etc/apache2/conf-available/apache2-graphite.conf"
                $graphite_cmd          = "/usr/bin/graphite-manage"
          }
        }



        file {
                $graphite_conf_file:
                        ensure  => present,
                        content => template("graphite/${osfamily}/local_settings.py.erb");
                $graphite_apache_file:                       
                        ensure  => present,
                        content => template("graphite/${osfamily}/graphite-web.conf.erb");
        }
   
   
   mysql::db { $graphite_db_name:
      user     => $graphite_db_user,
      password => $graphite_db_password,
      host     => $graphite_db_host,      
   }
   
   
   exec {
     'graphite_syncdb':
        command   => "$graphite_cmd syncdb --noinput",
        logoutput => true,
        require   => [ Mysql::Db["$graphite_db_name"], Class["mysql::python_connector"] ];
   }
}