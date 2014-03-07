require 'spec_helper'


describe CommandExecutor do

  it "can perform a command" do
    build = Build.create(:command => "ls -alrt", :remote => "localhost")
    CommandExecutor.perform(build.id)
    build.reload
    build.output.should_not be_nil
  end

end
