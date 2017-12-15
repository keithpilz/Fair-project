require 'bcrypt'

class User < ApplicationRecord
  has_many :email_statuses
  has_many :emails, through: :email_statuses
  scope :subscribed_users, -> { where(is_subscribed: true).ids }

  validates :email_address, uniqueness: true, presence: true

  def password
    @password ||= BCrypt::Password.new(password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(params)
    user = User.find_by(email_address: params[:email_address])
    return user if user && user.password = params[:password_hash]
  end
end
