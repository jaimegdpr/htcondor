class htcondor::scripts {
    
    $script_files = $htcondor::script_files_list

    $script_files.each |String $script_file| {
        file {"/root/scripts/${script_file}":
            ensure => present,
            owner => 'root',
            group => 'root',
            mode => '0755',
            source => "puppet:///grid_files/htcondor/${script_file}",
        }
    }

    
}
