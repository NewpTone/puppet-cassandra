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
	
  package {'cassandra':
     name 	=> 'cassandra',
     ensure 	=> 'present', 
     require 	=> Exec['apt-get update'],
  }


 exec { 'apt-get update': 
    path	        => '/usr/bin',
    refreshonly		=> true,
    subscribe   	=> [ Apt::Source["cassandra"]],
    logoutput  		=> true,
  }

}
