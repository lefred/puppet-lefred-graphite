class graphite::packages {

   
  case $::osfamily {
          'RedHat': {
                $require = Yumrepo['epel']
                $packs   = ["python-carbon", "graphite-web"]
                package {
                  $packs:
                    require => $require,
                    ensure  => "installed";
                } 
                
          }
          'Debian': {
                $packs   = ["graphite-carbon", "graphite-web"]
                package {
                  $packs:                 
                    ensure => "installed";
                }
                
                file {
                  "/etc/default/graphite-carbon":
                    content => "CARBON_CACHE_ENABLED=true",
                    require => Package['graphite-carbon']
                }
          }
  }
  
}