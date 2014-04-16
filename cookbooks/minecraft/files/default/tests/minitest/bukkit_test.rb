require 'minitest/spec'
#
## Cookbook Name:: minecraft
## Spec:: default

describe_recipe 'minecraft::default' do
  describe 'ensures craftbukkit jar exists' do
    let(:jar) { file("#{node['minecraft']['install_dir']}/#{minecraft_file(node['minecraft']['url'])}") }
    it { jar.must_have(:mode, '0644') }
    it { jar.must_have(:owner, node['minecraft']['user']) }
    it { jar.must_have(:group, node['minecraft']['group']) }
  end

  describe 'ensures bukkit.yml is present' do
    let(:config) { file("#{node['minecraft']['install_dir']}/bukkit.yml") }
    it { config.must_have(:mode, '0644') }
    it { config.must_have(:owner, node['minecraft']['user']) }
    it { config.must_have(:group, node['minecraft']['group']) }
  end

  describe 'ensures help.yml is present' do
    let(:config) { file("#{node['minecraft']['install_dir']}/bukkit.yml") }
    it { config.must_have(:mode, '0644') }
    it { config.must_have(:owner, node['minecraft']['user']) }
    it { config.must_have(:group, node['minecraft']['group']) }
  end

  describe 'ensures permissions.yml is present' do
    let(:config) { file("#{node['minecraft']['install_dir']}/bukkit.yml") }
    it { config.must_have(:mode, '0644') }
    it { config.must_have(:owner, node['minecraft']['user']) }
    it { config.must_have(:group, node['minecraft']['group']) }
  end

  describe 'ensures commands.yml is present' do
    let(:config) { file("#{node['minecraft']['install_dir']}/bukkit.yml") }
    it { config.must_have(:mode, '0644') }
    it { config.must_have(:owner, node['minecraft']['user']) }
    it { config.must_have(:group, node['minecraft']['group']) }
  end

  it 'ensures minecraft is running' do
    service('minecraft').must_be_running
  end
end
