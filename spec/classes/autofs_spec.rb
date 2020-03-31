require 'spec_helper'

describe 'autofs' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      it { is_expected.to compile }
      it { is_expected.to contain_package('autofs') }
      it { is_expected.to contain_service('autofs') }
      it { is_expected.to contain_file('/etc/auto.master.d').only_with('ensure' => 'directory') }
      it { is_expected.to contain_file_line('autofs_autofs::config_master') }
    end
  end
end
