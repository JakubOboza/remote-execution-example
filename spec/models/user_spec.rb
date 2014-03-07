require 'spec_helper'


describe User do

  it "is valid with email and password" do
    lambda do
      User.create(password: "password", email: "jakub.oboza@gmail.com")
    end.should change(User, :count).by(1)
  end

end