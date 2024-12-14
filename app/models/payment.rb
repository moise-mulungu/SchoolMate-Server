# app/models/payment.rb
class Payment < ApplicationRecord
  belongs_to :fee

  after_save :update_fee_total_paid

  private

  def update_fee_total_paid
    fee.update_total_paid
  end
end
