class htcondor::repositories {

    if ($osfamily == 'Redhat') and ($operatingsystemmajrelease == '7') {
        yumrepo { "htcondor-stable":
            name => "htcondor-stable-rhel7",
            descr => "HTCondor Stable RPM Repository for Redhat Enterprise Linux 7",
            baseurl => "http://research.cs.wisc.edu/htcondor/yum/stable/rhel7",
            gpgkey => "http://research.cs.wisc.edu/htcondor/yum/RPM-GPG-KEY-HTCondor",
            protect => 1,
            enabled => 1,
        }
    }
    elsif ($osfamily == 'Redhat') and ($operatingsystemmajrelease == '6') {
        yumrepo { "htcondor-stable":
            name => "htcondor-stable-rhel6",
            descr => "HTCondor Stable RPM Repository for Redhat Enterprise Linux 6",
            baseurl => "http://research.cs.wisc.edu/htcondor/yum/stable/rhel6",
            gpgkey => "http://research.cs.wisc.edu/htcondor/yum/RPM-GPG-KEY-HTCondor",
            protect => 1,
            enabled => 1,
        }
    }

}
