class AddOmniauthToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :provider, :string, null: false
    add_column :users, :uid, :string, null: false

    add_index :users, [:uid, :provider], unique: true
  end
end
