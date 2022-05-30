json.array! @week_desembolsos do |item|
  json.extract! item,  :week
  json.set! :name, @merchants.find(item.merchant_id).name
  json.set! :email, @merchants.find(item.merchant_id).email
  json.set! :cif, @merchants.find(item.merchant_id).cif

  @menor_50 = @week_desembolsos.where(merchant_id: @merchants.find(item.merchant_id))
                               .where("amount < ?", 50)
                               .sum(:amount)
  @menor_300 = @week_desembolsos.where(merchant_id: @merchants.find(item.merchant_id))
                                .where(amount: 50..300)
                                .sum(:amount)
  @mayor_300 = @week_desembolsos.where(merchant_id: @merchants.find(item.merchant_id))
                                .where("amount > ?", 300)
                                .sum(:amount)

  json.set! :disbursement,
            @menor_50 - @menor_50 * 1 / 100      +
              @menor_300 - @menor_300 * 0.95 / 100 +
              @mayor_300 - @mayor_300 * 0.85 / 100
end

