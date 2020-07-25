class UpdateUsersPasswordField < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :password_digest, :string
    remove_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :password, :string
    add_column :users, :salt, :string
  end
end
