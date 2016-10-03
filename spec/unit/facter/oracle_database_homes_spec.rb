require 'spec_helper'
require 'facter/oracle_database_homes'

describe 'opatch_patches', :type => :fact do
  before(:each) { Facter.clear }
  after(:each) { Facter.clear }

  describe 'when single oracle home exists' do
    before :each do
      allow(Object).to receive(:get_orainst_loc).and_return('/some/file/path')
      FileTest.stubs(:exists?)
      FileTest.expects(:exists?).with('/etc/oraInst.loc').returns true
    end
    it do
      expect(Facter.fact(:opatch_patches)).to eq 'TBC'
    end
  end
end
