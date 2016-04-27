require 'spec_helper'
require 'hiera'

describe 'autofs', :type => :class  do
  let(:hiera_config) { 'spec/fixtures/hiera/hiera.yaml' }
  hiera = Hiera.new(:config => 'spec/fixtures/hiera/hiera.yaml')
  autofs_shares = hiera.lookup('autofs_shares', nil, nil)

  let(:facts) {{:operatingsystem => 'Ubuntu', :osfamily => 'Debian'}}
  let(:params) {{:autofs_share_name => "foo", :autofs_shares => autofs_shares }}

  context 'should compile' do
    it { should compile }
  end
end
