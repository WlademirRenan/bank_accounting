require 'rails_helper'

RSpec.describe 'Get balance', type: :request do
  context 'when success' do
    it 'show balance' do
      account1 = Account.create(balance: 10.0)
      User.create(name: 'test', token: 'test123')

      get "/api/v1/balance?account_id=#{account1.id}", headers: { Authorization: "Bearer test123" }

      expect(response.status).to eq 200
      body = JSON.parse(response.body)
      expect(body['errors']).to eq []
      expect(body['balance']).to eq 10.0
      
    end
  end

  context 'when failure' do
    it 'show account not found' do
      User.create(name: 'test', token: 'test123')

      get "/api/v1/balance?account_id=000", headers: { Authorization: "Bearer test123" }

      expect(response.status).to eq 404
      body = JSON.parse(response.body)
      expect(body['errors']).to eq ["Account not found"]
      
    end

    it 'return status 401 case token invalid' do
      User.create(name: 'test', token: 'test123')

      get "/api/v1/balance?account_id=000", headers: { Authorization: "Bearer test1234" }

      expect(response.status).to eq 401
    end

    it 'return status 401 without token' do
      User.create(name: 'test', token: 'test123')

      get "/api/v1/balance?account_id=000"

      expect(response.status).to eq 401
    end
  end
end