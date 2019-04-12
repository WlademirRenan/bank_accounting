require 'rails_helper'

RSpec.describe Transference, type: :model do
  context '#add_transference' do
    it 'make credit and debit in accounts' do
      source_account = Account.create(balance: 10.0)
      destination_account = Account.create(balance: 10.0)
      
      Transference.create(amount: 5.0, source_account_id: source_account.id, destination_account_id: destination_account.id)
      
      expect(source_account.reload.balance).to eq 5.0
      expect(destination_account.reload.balance).to eq 15.0
    end
  end
end
