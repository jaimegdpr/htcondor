class htcondor::user_group {

    $account_uid = $htcondor::condor_account_uid
    $group_gid = $htcondor::condor_group_gid

    group {'condor':
        ensure => present,
        gid => $group_gid,
        system => yes,
    }

    user {'condor':
        ensure => present,
        uid => $account_uid,
        gid => $group_gid,
        home => '/var/lib/condor',
        shell => '/sbin/nologin',
        comment => 'Owner of Condor Daemons',
        system => true,
        require => Group['condor'],
    }


}
