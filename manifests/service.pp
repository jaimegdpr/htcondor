class htcondor::service {

    service {'condor':
        ensure => running,
        enable => true,
        hasrestart => true,
        hasstatus => true,
    }

}
