require 'spec_helper'
require 'hiera'

describe 'autofs', :type => :class  do
  let(:facts) {{:operatingsystem => 'Ubuntu', :lsbdistrelease => '16.04'}}
  context 'should compile' do
    it { should compile }
  end
end
