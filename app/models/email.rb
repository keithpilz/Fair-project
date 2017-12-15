class Email < ApplicationRecord
  has_many :email_statuses
  has_many :users, through: :email_statuses
  validates :subject, :body, presence: true
  scope :latest_published_email, -> { where(is_published: true).last }

end
