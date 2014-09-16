class graphite::service{
  
  service {
    "carbon-cache":
            enable    => true,
            ensure    => running,
            require   => Package[$graphite::packages::packs],
  }
  
}