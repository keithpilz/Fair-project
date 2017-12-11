class User < ApplicationRecord
  has_many :email_statuses
  has_many :emails, through: :email_statuses

end
