class htcondor::config {
    
    $config_files = $htcondor::config_files_list

    file {'/root/condor':
        ensure => directory,
        owner => 'root',
        group => 'root',
        mode => '0755',
    }

#    $htc_config_files_array = lookup('htcondor::config_files', Array[String], 'unique', undef)
#    $htc_config_files_array.each |String $htc_config_file| {

    $config_files.each |String $config_file| {
        file {"/etc/condor/config.d/${config_file}":
            ensure => present,
            owner => 'root',
            group => 'root',
            mode => '0644',
            source => "puppet:///grid_files/htcondor/${config_file}",
        }
    }

    file {'/etc/condor/pool_password':
            ensure => present,
            owner => 'root',
            group => 'root',
            mode => '0600',
            source => "puppet:///grid_files/htcondor/pool_password",
    }
    
}
