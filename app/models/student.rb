# app/models/student.rb
class Student < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :fees
end
