class graphite::config {

   $graphite_db_name     = $graphite::graphite_db_name
   $graphite_db_engine   = $graphite::graphite_db_engine
   $graphite_db_user     = $graphite::graphite_db_user
   $graphite_db_password = $graphite::graphite_db_password
   $graphite_db_host     = $graphite::graphite_db_host
   $graphite_db_port     = $graphite::graphite_db_port

   case $::osfamily {
          'RedHat': {
                $graphite_conf_file = "/etc/graphite-web/local_settings.py"
                
          }
          'Debian': {
                $graphite_conf_file = "/etc/graphite/local_settings.py"
          }
        }



        file {
                $graphite_conf_file:
                        ensure  => present,
                        content => template("graphite/${osfamily}/local_settings.py.erb"),
        }

}