class htcondor::cron_config {

    file {'/root/condor/init_worker_condor_vars.sh':
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => '0755',
        source => 'puppet:///grid_files/htcondor/init_worker_condor_vars.sh',
    } ->

    cron::job { 'condor_init_wn_vars':
            minute      => '@reboot',
            hour        => '',
            date        => '',
            month       => '',
            weekday     => '',
            user        => 'root',
            command     => '/root/condor/init_worker_condor_vars.sh',
            mode => '0600',
            environment => [ 'PATH="/sbin:/bin:/usr/sbin:/usr/bin:/root/scripts"', ],
    }




}
