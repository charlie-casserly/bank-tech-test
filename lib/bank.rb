require_relative 'printer'
require_relative 'account_log'

class Bank
  attr_reader :account_log

  def initialize(account_log = AccountLog.new)
    @account_log = account_log
    @balance = 0
  end

  def deposit(amount)
    invalid_input_message unless valid_input?(amount)
    @balance += amount
    account_log.update(amount, balance)
  end

  def withdraw(amount)
    invalid_input_message unless valid_input?(amount)
    raise "Insufficient funds" if insufficient_funds?(amount)
    @balance -= amount
  end

  def show_balance
    balance
  end

  private 

  attr_reader :balance

  def invalid_input_message
    raise "Invalid input. Please try again."
  end

  def valid_input?(amount)
    amount.is_a?(Integer) || amount.is_a?(Float)
  end
  
  def insufficient_funds?(amount)
    balance - amount < 0
  end
end