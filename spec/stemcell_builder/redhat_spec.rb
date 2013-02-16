require 'spec_helper'

describe Bosh::Agent::StemCell::RedhatBuilder do


  before(:each) do
    @agent_file = File.join("bosh-agent.gem")
    FileUtils.touch @agent_file
    @stemcell = Bosh::Agent::StemCell::RedhatBuilder.new({:agent_src_path => @agent_file})
  end

  after(:each) do
    FileUtils.rm_f @agent_file
  end

  it "Should initialize type properly" do
    @stemcell.type.should eq "redhat"
  end

  it "Should initialize the manifest should properly" do
    @stemcell.manifest.values_at(:cloud_properties).should_not be_nil
    @stemcell.manifest[:cloud_properties][:root_device_name].should eq '/dev/sda1'
  end

  it "Should initialize default options properly" do
    @stemcell.type.should eq "redhat"
    @stemcell.iso.should eq "http://rhnproxy1.uvm.edu/pub/redhat/rhel6-x86_64/isos/rhel-server-6.3-x86_64-dvd.iso"
    @stemcell.iso_md5.should eq "d717af33dd258945e6304f9955487017"
    @stemcell.iso_filename.should eq "rhel-server-6.3-x86_64-dvd.iso"
  end

  it "Should initialize override options properly" do
    @stemcell = Bosh::Agent::StemCell::RedhatBuilder.new({:agent_src_path => @agent_file, :iso => "http://example.com/rhel.iso", :iso_md5 => "123", :iso_filename => "rhel.iso"})
    @stemcell.type.should eq "redhat"
    @stemcell.iso.should eq "http://example.com/rhel.iso"
    @stemcell.iso_md5.should eq "123"
    @stemcell.iso_filename.should eq "rhel.iso"
  end

end