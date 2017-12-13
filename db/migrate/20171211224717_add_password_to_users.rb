class AddPasswordToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :password_hash, :string, default: nil
  end
end
