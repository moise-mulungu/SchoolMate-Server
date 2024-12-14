# app/models/fee.rb
class Fee < ApplicationRecord
  belongs_to :student
  has_many :payments

  def update_total_paid
    self.total_paid = payments.sum(:amount)
    self.paid = total_paid >= amount
    save
  end
end
