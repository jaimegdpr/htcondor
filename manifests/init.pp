class htcondor (

    $condor_version        = '8.6.5-1.el6',
    $condor_account_uid    = 990,
    $condor_group_gid      = 990,
    $config_files_list     = ['30-ciemat.conf', '60-startd.conf'],
    $script_files_list     = ['coord_drain_run.py', 'coord_drain_control.py'],

    ) {

    require ypbind

    include htcondor::config
    include htcondor::scripts
    include htcondor::cron_config
    include htcondor::install
    include htcondor::logrotate_config
    include htcondor::repositories
    include htcondor::service
    include htcondor::pre_install

    #User 'condor' must be created before installing the package
    Class['htcondor::pre_install'] ->
    Class['htcondor::repositories'] -> 
    Class['htcondor::install'] -> 
    Class['htcondor::config'] ->
    Class['htcondor::scripts'] ->
    Class['htcondor::cron_config'] ->
    Class['htcondor::logrotate_config'] ->
    Class['htcondor::service']

}
