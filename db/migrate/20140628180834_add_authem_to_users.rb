class AddAuthemToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password, :string
    add_column :users, :password_confirmation, :string
    add_column :users, :password_digest, :string
    add_column :users, :remember_token, :string
    add_column :users, :password_reset_token, :string
    add_column :users, :session_token, :string
  end
end
