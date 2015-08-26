class Subscriber < ActiveRecord::Base
  validates :email, uniqueness: true
end
