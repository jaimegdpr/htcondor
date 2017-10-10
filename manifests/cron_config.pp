class htcondor::cron_config {

    file {'/root/condor/init_worker_condor_vars.sh':
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => '0755',
        source => 'puppet:///grid_files/htcondor/init_worker_condor_vars.sh',
#        notify => Exec['init_condor_vars']
    }

#    #Script needs to be run if the host isn't rebooted
#    exec {'init_condor_vars':
#        command => '/root/condor/init_worker_condor_vars.sh',
#        refreshonly => true,
#    }

    cron::job { 'condor_init_wn_vars':
            minute      => '@reboot',
            hour        => '',
            date        => '',
            month       => '',
            weekday     => '',
            user        => 'root',
            command     => '/root/condor/init_worker_condor_vars.sh >> /var/log/init_worker_condor.log 2>&1' ,
            mode => '0600',
            environment => [ 'PATH="/sbin:/bin:/usr/sbin:/usr/bin:/root/scripts"', ],
            require => File['/root/condor/init_worker_condor_vars.sh'],
    }




}
