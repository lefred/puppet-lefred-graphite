module for graphite

The purpose is to use it for sensu and with MySQL backend too

This is how I define it in hiera:

      classes:
          - mysql
          - mysql::server
          - graphite

      mysql::mysql_root_password:     "fred321"
      mysql::mysql_distro:            "percona"
      mysql::mysql_version:           "5.5"
      mysql::mysql_serverid:          "2"
      mysql::mysql_bind_interface:    "eth1"
      mysql::ensure:                  "running"
      graphite::graphite_db_password: "fred"

