class TransferenceService

  def initialize(params = {})
    @source_account_id = params[:source_account_id]
    @destination_account_id = params[:destination_account_id]
    @amount = params[:amount].to_f
    @errors = []
  end

  attr_accessor :source_account_id, :destination_account_id, :amount, :errors

  def call
    validate_transference
    Transference.create(transfer_params) if errors.empty?
  end

  def transfer_params
    { amount: @amount, source_account_id: @source_account_id, destination_account_id: @destination_account_id }
  end

  def validate_transference
    validate_fields
    validate_accounts if @errors.empty?
    validate_balance if @errors.empty?
  end

  def validate_fields
    @errors << "source_account_id is required" if @source_account_id.blank?
    @errors << "destination_account_id is required" if @destination_account_id.blank?
    @errors << "amount is invalid" if amount_invalid?
    @errors << "source and destination accounts is same" if same_accounts?
  end

  def validate_accounts
    @errors << "source account not exists" unless Account.exists? @source_account_id
    @errors << "destination account not exists" unless Account.exists? @destination_account_id
  end
  
  def validate_balance
    @errors << "source account not have balance for this operation" if source_less_balance?
  end

  def amount_invalid?
    return true if @amount.blank? || @amount.zero?
    false
  end

  def same_accounts?
    @source_account_id.eql? @destination_account_id
  end

  def source_less_balance?
    Account.get_balance(@source_account_id) < @amount.to_f
  end
end