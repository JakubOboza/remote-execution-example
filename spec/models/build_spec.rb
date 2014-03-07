require 'spec_helper'

describe Build do

  it "needs to have command and remote" do
    Build.new(:command => "ls -l", :remote => "pi@192.168.1.22").should be_valid
  end

  it "creates worker task when being created" do
    Resque.should_receive(:enqueue).with(CommandExecutor, anything())
    lambda do
      Build.create(:command => "ls -l", :remote => "localhost")
    end.should change(Build, :count).by(1)
  end

end
