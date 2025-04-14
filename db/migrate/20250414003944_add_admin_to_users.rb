class AddAdminToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :email, :string, null: false
    add_index :users, :email, unique: true
  end
end
