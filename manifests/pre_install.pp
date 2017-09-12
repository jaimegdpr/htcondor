class htcondor::pre_install {

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

    file {['/var/lib/condor/', '/home/condor']:
        ensure => directory,
        owner => 'condor',
        group => 'condor',
        mode => '0755',
        before => File['/home/condor/execute']
    }

    file {'/home/condor/execute':
        ensure => directory,
        owner => 'condor',
        group => 'condor',
        mode => '0755',
    }

    file {'/var/lib/condor/execute/':
        ensure => link,
        target => '/home/condor/execute',
        require => File['/home/condor/'],
    }

}
