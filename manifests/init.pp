class graphite {

  include graphite::packages
  include graphite::service
 
  Class['graphite::packages'] ->  Class['graphite::service'] 
}