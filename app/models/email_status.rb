class EmailStatus < ApplicationRecord
  belongs_to :email
  belongs_to :user


end
