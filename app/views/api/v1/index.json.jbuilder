json.array! @merchants do |merchant|
  json.extract! merchant, :name, :email, :cif
  menor_50 = merchant.orders.where.not(completed_at: nil)
                     .where(merchant_id: merchant.id)
                     .where("amount < ?", 50)
                     .sum(:amount)
  menor_300 = merchant.orders.where.not(completed_at: nil)
                      .where(merchant_id: merchant.id)
                      .where(amount: 50..300)
                      .sum(:amount)
  mayor_300 = merchant.orders.where.not(completed_at: nil)
                      .where(merchant_id: merchant.id)
                      .where("amount > ?", 300)
                      .sum(:amount)
  json.set! :disbursement,
            menor_50 - menor_50 * 1 / 100      +
              menor_300 - menor_300 * 0.95 / 100 +
              mayor_300 - mayor_300 * 0.85 / 100
end
