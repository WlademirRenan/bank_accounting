class TransferenceService

  def initialize(params = {})
    @source_account_id = params[:source_account_id]
    @destination_account_id = params[:destination_account_id]
    @amount = params[:amount]
    @errors = []
  end

  attr_accessor :source_account_id, :destination_account_id, :amount, :errors

  def call
    validate_fields
    # make transfer if errors.empty?
  end

  def validate_fields
    @errors << "source_account_id is required" if @source_account_id.blank?
    @errors << "destination_account_id is required" if @destination_account_id.blank?
    @errors << "amount is invalid" if amount_invalid?
    @errors << "source and destination accounts is same" if same_accounts?
  end

  def amount_invalid?
    return true if @amount.blank? || @amount.zero?
    false
  end

  def same_accounts?
    @source_account_id.eql? @destination_account_id
  end
end