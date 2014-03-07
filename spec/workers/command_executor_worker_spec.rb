require 'spec_helper'


describe CommandExecutor do

  it "can perform a command" do
    build = Build.create(:command => "ls -alrt", :remote => "localhost")
    CommandExecutor.perform(build.id)
    build.reload
    build.output.should_not be_nil
  end

  it "handles it ok when build explodes" do
    build = Build.create(:command => "ls -alrt", :remote => "localhost")
    Rush::Box.should_receive(:new).and_raise("unable to perform!")
    CommandExecutor.perform(build.id)
    build.reload
    build.state.should == "failed"
  end

end
