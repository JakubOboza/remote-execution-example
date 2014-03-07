class AddRemoteToTheBuild < ActiveRecord::Migration
  def change
    add_column(:builds, :remote, :string)
  end
end
