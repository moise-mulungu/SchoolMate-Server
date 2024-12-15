# app/models/teacher.rb
class Teacher < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :classes
end
