class Email < ApplicationRecord
  has_many :email_statuses
  has_many :users, through: :email_statuses

end
