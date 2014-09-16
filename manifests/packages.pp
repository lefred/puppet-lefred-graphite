class graphite::packages {

   
  case $::osfamily {
          'RedHat': {
                $require = Yumrepo['epel']
                $packs   = ["python-carbon", "graphite-web"]
                $carbon_bin = "carbon-cache"
                package {
                  $packs:
                    require => $require,
                    ensure  => "installed";
                } 
                
          }
          'Debian': {
                $packs   = ["graphite-carbon", "graphite-web"]
                $carbon_bin = "carbon-cache"
                package {
                  $packs:                 
                    ensure => "installed";
                }
          }
  }
  
}