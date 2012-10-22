# /etc/puppet/modules/cassandra/manifests/init.pp

class cassandra {

  apt::source { "cassandra":
  location          => "http://www.apache.org/dist/cassandra/debian",
  release           => "",
  repos             => "11x main",
  key               => "4BD736A82B5C1B00",
  key_server        => "pgp.mit.edu",
  pin               => "500",
  include_src       => true
}
        group { "cassandra":
		ensure => present,
		gid => "900",
	}

	user { "cassandra":
		ensure => present,
		comment => "Cassandra",
		password => "!!",
		uid => "900",
		gid => "900",
		shell => "/bin/bash",
		home => "/home/cassandra",
		require => Group["cassandra"],
	}
		
	

}
