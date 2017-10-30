class htcondor::scripts {
    
    $script_files = $htcondor::script_files_list

    file {'/root/scripts':
        ensure => directory,
        owner => 'root',
        group => 'root',
        mode => '0755',
    }

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
