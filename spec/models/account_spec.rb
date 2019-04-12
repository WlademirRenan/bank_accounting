require 'rails_helper'

RSpec.describe Account, type: :model do
  context "credit" do
    it 'should add amount to balance' do
      account = Account.create(balance: 10.0)
      account.credit(12.0)
      expect(account.balance).to eq 22.0 
    end
  end

  context "debit" do
    it 'should remove amount to balance' do
      account = Account.create(balance: 10.0)
      account.debit(1.0)
      expect(account.balance).to eq 9.0
    end
  end
  
end
