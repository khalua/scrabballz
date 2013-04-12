class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :username
      t.boolean :is_online
      t.string  :channel
      t.timestamps
    end
  end
end
