class DropFollows < ActiveRecord::Migration
  def change
    drop_table :follows
  end
end
