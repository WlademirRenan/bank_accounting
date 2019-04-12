require 'rails_helper'

RSpec.describe TransferenceService, type: :model do
  before(:each) do
    @source_account = Account.create(balance: 10.0)
    @destination_account = Account.create(balance: 10.0)
    @transference = subject.class.new(amount: 10.0, source_account_id: @source_account.id, destination_account_id: @destination_account.id)
  end
  context "when date invalid" do

    it 'source_account_id is null' do
      @transference.source_account_id = nil
      @transference.call
      expect(@transference.errors).to eq ["source_account_id is required"]
    end

    it 'destination_account_id is null' do
      @transference.destination_account_id = nil
      @transference.call
      expect(@transference.errors).to eq ["destination_account_id is required"]
    end

    it 'amount is null' do
      @transference.amount = nil
      @transference.call
      expect(@transference.errors).to eq ["amount is invalid"]
    end

    it 'amount is zero' do
      @transference.amount = 0.0
      @transference.call
      expect(@transference.errors).to eq ["amount is invalid"]
    end

    it 'amount, destination_account_id and source_account_id' do
      subject.call
      expect(subject.errors.size).to eq 4
    end

    it 'account_source_id and account_destination_id is same' do
      @transference.destination_account_id = @source_account.id
      @transference.call
      expect(@transference.errors).to eq ["source and destination accounts is same"]
    end

    it 'balance source account is minor than amount for transference' do
      @transference.amount = 11.0
      @transference.call
      expect(@transference.errors).to eq ["source account not have balance for this operation"]
    end
  end

  context "verify fields" do
    it 'return amount and accounts' do
      expect(subject.transfer_params.class).to eq Hash
    end
  end
end
