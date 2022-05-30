require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'merchants.csv'))
csv = CSV.parse(csv_text.scrub, headers: true)
csv.each do |row|
  Merchant.create(name: row['name'], email: row['email'], cif: row['cif'])
end
puts "Merchants upload finished"

#--------------------------------------------------------------------
csv_text = File.read(Rails.root.join('lib', 'seeds', 'shoppers.csv'))
csv = CSV.parse(csv_text.scrub, headers: true)
csv.each do |row|
  Shopper.create(name: row['name'], email: row['email'], nif: row['nif'])
end
puts "Shoppers upload finished"

#--------------------------------------------------------------------
csv_text = File.read(Rails.root.join('lib', 'seeds', 'orders.csv'))
csv = CSV.parse(csv_text.scrub, headers: true)
csv.each do |row|
  Order.create(merchant_id: row['merchant_id'], shopper_id: row['shopper_id'], amount: row['amount'], created_at: row['created_at'], completed_at: row['completed_at'], week: row['week'])
end
puts "Orders upload finished"
