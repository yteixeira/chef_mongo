#
# Cookbook:: mongo
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mongo::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'should update all sources' do
      expect(chef_run).to update_apt_update('update')
    end
    it 'should add mongo to the source list' do
      expect(chef_run).to add_apt_repository('mongodb-org')
    end
    it 'should install mongo' do
      expect(chef_run).to upgrade_package('mongodb-org')
    end

    at_exit { ChefSpec::Coverage.report! }
  end
end
