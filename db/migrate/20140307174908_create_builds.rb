class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.integer :user_id
      t.string  :command
      t.text    :output
      t.string  :state
      t.timestamps
    end
  end
end
