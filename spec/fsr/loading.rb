require 'spec/helper'


describe "Testing FSR module loading methods" do
  # When you add applications  you must modify the expected apps_loaded behavior
  it "Loads all applications" do
    apps_loaded = FSR.load_all_applications
    apps_loaded.kind_of?(Array).should == true
    apps_loaded.include?(:conference).should == true
    apps_loaded.include?(:bridge).should == true
    apps_loaded.include?(:fifo).should == true
  end

  # When you add commands  you must modify the expected cmds_loaded behavior
  it "Loads all commands" do
    cmds_loaded = FSR.load_all_commands
    cmds_loaded.kind_of?(Array).should == true
    cmds_loaded.include?(:originate)
    cmds_loaded.include?(:sofia)
  end
end
