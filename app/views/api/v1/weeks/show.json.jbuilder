json.array! @week_disbursements do |item|
  json.extract! item,  :week
  json.set! :name, @merchants.find(item.merchant_id).name
  json.set! :email, @merchants.find(item.merchant_id).email
  json.set! :cif, @merchants.find(item.merchant_id).cif

  @less_50e = @week_disbursements.where(merchant_id: @merchants.find(item.merchant_id))
                                 .where("amount < ?", 50)
                                 .sum(:amount)
  @less_300e = @week_disbursements.where(merchant_id: @merchants.find(item.merchant_id))
                                  .where(amount: 50..300)
                                  .sum(:amount)
  @greater_300e = @week_disbursements.where(merchant_id: @merchants.find(item.merchant_id))
                                     .where("amount > ?", 300)
                                     .sum(:amount)

  json.set! :disbursement,
                                  @less_50e - @less_50e * 1 / 100      +
                                  @less_300e - @less_300e * 0.95 / 100 +
                                  @greater_300e - @greater_300e * 0.85 / 100
end

