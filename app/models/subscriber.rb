class Subscriber < ActiveRecord::Base
  validates :email,
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i },
    uniqueness: true
end
