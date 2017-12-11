class RenameEmailToUserEmailAddress < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :email, :user_email_address
  end
end
