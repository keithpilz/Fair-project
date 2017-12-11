class AddPasswordToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :encrypted_password, :string, default: nil
  end
end
