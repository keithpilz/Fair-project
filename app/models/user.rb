class User < ApplicationRecord
  has_many :email_statuses
  has_many :emails, through: :email_statuses

  validates :user_email_address, uniqueness: true
end
