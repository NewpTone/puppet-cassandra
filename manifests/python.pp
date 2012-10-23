class cassandra::python {

   package {'python-pip':
      ensure => 'present',
   }
   
   exec {'pip install pycassa':
	path => '/usr/bin',
   }
   Package['python-pip'] -> Exec['pip install pycassa']	
} 
