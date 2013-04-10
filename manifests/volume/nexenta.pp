#
class cinder::volume::nexenta (
  $nexenta_login,
  $nexenta_password,
  $nexenta_host,
  $nexenta_volume               = 'cinder',
  $nexenta_target_prefix        = 'iqn:',
  $nexenta_target_group_prefix  = 'cinder/',
  $nexenta_blocksize            = '8k',
  $nexenta_sparse               = 'True'
) {

  include cinder::params

  cinder_config {
    'DEFAULT/nexenta_login':                value => $nexenta_login;
    'DEFAULT/nexenta_password':             value => $nexenta_password;
    'DEFAULT/nexenta_host':                 value => $nexenta_host;
    'DEFAULT/nexenta_volume':               value => $nexenta_volume;
    'DEFAULT/nexenta_target_prefix':        value => $nexenta_target_prefix;
    'DEFAULT/nexenta_target_group_prefix':  value => $nexenta_target_group_prefix;
    'DEFAULT/nexenta_blocksize':            value => $nexenta_blocksize;
    'DEFAULT/nexenta_sparse':               value => $nexenta_sparse;
    'DEFAULT/volume_driver':                value => 'cinder.volume.drivers.nexenta.volume.NexentaDriver';
  }

}
