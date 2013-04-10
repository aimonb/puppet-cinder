require 'spec_helper'

describe 'cinder::volume::nexenta' do

  let :req_params do {
    :nexenta_login           => 'nexenta',
    :nexenta_password        => 'password',
    :nexenta_host            => '127.0.0.2',
  } end

  let :default_params do {
    :nexenta_volume               => 'cinder',
    :nexenta_target_prefix        => 'ign:',
    :nexenta_target_group_prefix  => 'cinder/',
    :nexenta_blocksize            => '8k',
    :nexenta_sparse               => 'True'
  } end

  describe 'with default params' do

    let :params_hash do
      default_params.merge(req_params)
    end

   it 'should lay down nexenta config' do
     params_hash.keys do |config|
       should contain_cinder_config("DEFAULT/#{config}").with_value(param_hash[config])
     end
   end
  end
end
