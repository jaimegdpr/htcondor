class htcondor::install {

    $condor_package_version = $htcondor::condor_version
    $condor_packages = ['condor',
                        'condor-python',
                        'condor-classads',
                        'condor-external-libs',
                        'condor-procd']


    if ($osfamily == 'Redhat') and ($operatingsystemmajrelease == '6') {
        package {'ecryptfs-utils':
            ensure => present,
            before => Package['condor']
        }
    }

    package {$condor_packages:
        ensure => "${condor_package_version}",
    }

}
