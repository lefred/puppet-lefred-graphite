class graphite ( $graphite_db_name = "graphite", 
                 $graphite_db_engine = "mysql",
                 $graphite_db_user = "graphite",
                 $graphite_db_password = "secret",
                 $graphite_db_host = "localhost",
                 $graphite_db_port = "3306"
               ) {

  include graphite::packages
  include graphite::service
  include graphite::config
 
  Class['mysql::config'] -> Class['graphite::packages'] ->  Class['graphite::config'] ->  Class['graphite::service'] 
}