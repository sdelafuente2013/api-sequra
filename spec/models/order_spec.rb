require 'rails_helper'

RSpec.describe Order, :type => :model do
  it "is not valid without a amount" do
    order = Order.new(amount: nil)
    expect(order).to_not be_valid
  end
  it "is not valid without a number week" do
    order = Order.new(week: nil)
    expect(order).to_not be_valid
  end
end