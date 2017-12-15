class Email < ApplicationRecord
  has_many :email_statuses
  has_many :users, through: :email_statuses
  validates :subject, :body, presence: true
  scope :latest_published_email_subject, -> { where(published: true).last.subject }
  scope :latest_published_email_body, -> { where(published: true).last.body }

end
