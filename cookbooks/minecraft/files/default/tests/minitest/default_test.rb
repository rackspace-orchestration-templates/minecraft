require 'minitest/spec'
#
## Cookbook Name:: minecraft
## Spec:: default

describe_recipe 'minecraft::default' do
  describe 'ensures the install directory is present' do
    let(:dir) { directory(node['minecraft']['install_dir']) }
    it { dir.must_have(:mode, '0755') }
    it { dir.must_have(:owner, node['minecraft']['user']) }
    it { dir.must_have(:group, node['minecraft']['group']) }
  end

  describe 'ensures minecraft jar exists' do
    let(:jar) { file("#{node['minecraft']['install_dir']}/#{minecraft_file(node['minecraft']['url'])}") }
    it { jar.must_have(:mode, '0644') }
    it { jar.must_have(:owner, node['minecraft']['user']) }
    it { jar.must_have(:group, node['minecraft']['group']) }
  end

  describe 'ensures server.properties is present' do
    let(:config) { file("#{node['minecraft']['install_dir']}/server.properties") }
    it { config.must_have(:mode, '0644') }
    it { config.must_have(:owner, node['minecraft']['user']) }
    it { config.must_have(:group, node['minecraft']['group']) }
  end

  describe 'ensures the install directory is present' do
    let(:dir) { directory(node['minecraft']['install_dir']) }
    it { dir.must_have(:mode, '0755') }
    it { dir.must_have(:owner, node['minecraft']['user']) }
    it { dir.must_have(:group, node['minecraft']['group']) }
  end

  it 'ensures minecraft is running' do
    service('minecraft').must_be_running
  end
end
