class htcondor::logrotate_config {

    logrotate::rule {'htcondor':
        path => '/var/log/condor/*Log',
        rotate => 30,
        compress => true,
        missingok => true,
        size => '10M',
    }

}
