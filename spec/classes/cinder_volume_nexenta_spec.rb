# author 'Aimon Bustardo <abustardo at morphlabs dot com>'
# license 'Apache License 2.0'
# description 'configures openstack cinder nexenta driver'
require 'spec_helper'

describe 'cinder::volume::nexenta' do

  let :req_params do
    {
      :nexenta_user            => 'nexenta',
      :nexenta_password        => 'password',
      :nexenta_host            => '127.0.0.2',
    }
  end

  let :default_params do
    {
      :nexenta_volume               => 'cinder',
      :nexenta_target_prefix        => 'ign:',
      :nexenta_target_group_prefix  => 'cinder/',
      :nexenta_blocksize            => '8k',
      :nexenta_sparse               => 'True'
    }
  end

  let :facts do
    {:osfamily => 'Debian'}
  end


  context 'with only required params' do
    let :params do
      default_params.merge(req_params)
    end

    it 'configures nexenta volume driver' do
      params.each_pair do |config, value|
        should contain_cinder_config("DEFAULT/#{config}").with_value(value)
      end
    end

  end

end
