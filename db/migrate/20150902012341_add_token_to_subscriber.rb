class AddTokenToSubscriber < ActiveRecord::Migration
  def change
    add_column :subscribers, :token, :string, null: false
    add_index :subscribers, :token, unique: true
  end
end
