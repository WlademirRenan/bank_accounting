require 'rails_helper'

RSpec.describe TransferenceService, type: :model do
  context "when date invalid" do
    before(:each) do
      @transference = subject.class.new(amount: 10.0, source_account_id: 1, destination_account_id: 2)
    end

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
      @transference.destination_account_id = 1
      @transference.call
      expect(@transference.errors).to eq ["source and destination accounts is same"]
    end
  end
end
