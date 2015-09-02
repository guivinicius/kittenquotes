class Subscriber < ActiveRecord::Base
  has_secure_token

  validates :email,
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i },
    uniqueness: true
end
