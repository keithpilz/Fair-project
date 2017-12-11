class CreateEmailStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :email_statuses do |t|
      t.integer :user_id
      t.integer :email_id

      t.timestamps
    end
  end
end
