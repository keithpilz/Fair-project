class AddPublishedToEmails < ActiveRecord::Migration[5.0]
  def change
    add_column :emails, :is_published, :boolean, default: false
  end
end
