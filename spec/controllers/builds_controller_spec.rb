require 'spec_helper'

describe BuildsController do

  it "can route to builds" do
    { :get =>  "/builds"}.should be_routable
    { :post => "/builds"}.should be_routable
  end

  describe "anonym" do
    it "can't see builds not logged in" do
      get :index
      response.should be_redirect
    end
  end

  describe "actions" do

    before(:each) do
      @user = User.create(email: "jakub.oboza@gmail.com", password: "password")
      sign_in @user
    end

    it "can render new build form" do
      get :new
      response.should be_success
    end

    it "can list all builds" do
      get :index
      response.should be_success
    end

    it "will not create build with wrong params" do
      lambda do
        post :create, build: {command: "omg not valid params set"}
      end.should_not change(Build, :count)
    end

    it "can create build" do
      lambda do
        lambda do
          post :create, build: {command: "ls -l", remote: "localhost"}
          response.should be_redirect
        end.should change(Build, :count).by(1)
      end.should change(@user.builds, :count).by(1)
    end

  end

end
