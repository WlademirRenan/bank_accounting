class Account < ApplicationRecord
  def self.get_balance(account_id)
    account = Account.where(id: account_id)
    account.empty? ? 0.0 : account.take.balance
  end

  def credit(amount)
    self.balance += amount
    self.save
  end

  def debit(amount)
    self.balance -= amount
    self.save
  end
end
