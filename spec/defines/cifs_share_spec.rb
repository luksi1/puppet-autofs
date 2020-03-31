require 'spec_helper'

describe 'autofs::cifs::share' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:title) { 'foo' }
      let(:params) do
        {
          source: 'foo',
          destination: 'bar',
          domain: 'domain.com',
          uid: '999',
          gid: '999',
        }
      end

      it { is_expected.to compile }
      it { is_expected.to contain_package('cifs') }
      it { is_expected.to contain_file('/etc/auto.master.d/foo.autofs') }
      it { is_expected.to contain_file('autofs_foo').with('path' => '/etc/foo') }

    end
  end
end
