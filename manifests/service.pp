class htcondor::service {

    service {'condor':
        enable => true,
        hasrestart => true,
        hasstatus => true,
    }

}
