require 'rails_helper'

RSpec.describe Merchant, :type => :model do
  it "is not valid without a name" do
    merchant = Merchant.new(name: nil)
    expect(merchant).to_not be_valid
  end

  it "is not valid without a email" do
    merchant = Merchant.new(email: nil)
    expect(merchant).to_not be_valid
  end

  subject {
    described_class.new(name: 'John', email: 'john@home.xyz')
  }

  describe 'validation for email:' do
    context '=> when email is not unique' do
      before { described_class.create!(name: 'foo', email: 'john@home.xyz') }
      it {expect(subject).to be_invalid}
    end

    context '=> when email is  unique' do
      before { described_class.create!(name: 'foo', email: 'jane@home.xyz') }
      it {expect(subject).to be_valid}
    end

  end
end