json.array! @merchants do |merchant|
  json.extract! merchant, :name, :email, :cif
  less_50e = merchant.orders.where.not(completed_at: nil)
                     .where(merchant_id: merchant.id)
                     .where("amount < ?", 50)
                     .sum(:amount)
  less_300e = merchant.orders.where.not(completed_at: nil)
                      .where(merchant_id: merchant.id)
                      .where(amount: 50..300)
                      .sum(:amount)
  greater_300e = merchant.orders.where.not(completed_at: nil)
                      .where(merchant_id: merchant.id)
                      .where("amount > ?", 300)
                      .sum(:amount)
  json.set! :disbursement,
                      less_50e - less_50e * 1 / 100      +
                      less_300e - less_300e * 0.95 / 100 +
                      greater_300e - greater_300e * 0.85 / 100
end

