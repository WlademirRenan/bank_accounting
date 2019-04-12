require 'rails_helper'

RSpec.describe 'POST transference amount', type: :request do
  context 'when success' do
    it 'make transference' do
      account1 = Account.create(balance: 10.0)
      account2 = Account.create(balance: 10.0)

      params = { source_account_id: account1.id, destination_account_id: account2.id, amount: 10.0 }

      post '/api/v1/transference', params: params

      expect(response.status).to eq 201
      expect(JSON.parse(response.body)['errors']).to eq []
      expect(account1.reload.balance).to eq 0.0
      expect(account2.reload.balance).to eq 20.0
    end
  end

  context 'when failure' do
    it 'error case something param nil' do
      params = { source_account_id: 1, destination_account_id: nil, amount: 10.0 }

      post '/api/v1/transference', params: params
    
      expect(response.status).to eq 422
      expect(JSON.parse(response.body)['errors']).to eq ["destination_account_id is required"]
    end
  end
end