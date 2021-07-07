require_relative 'printer'
require_relative 'statement'

class Account
  attr_reader :statement

  def initialize(statement = Statement.new)
    @statement = statement
  end

  def deposit(amount)
    raise 'Invalid input. Please try again.' unless valid_input?(amount)

    statement.record_deposit(amount)
  end

  def withdraw(amount)
    raise 'Invalid input. Please try again.' unless valid_input?(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)

    statement.record_withdrawal(amount)
  end

  private

  def valid_input?(amount)
    amount.is_a?(Integer) || amount.is_a?(Float)
  end

  def insufficient_funds?(amount)
    balance = 0
    statement.log.each do |entry|
      balance += entry[:deposit].to_i if entry[:withdraw] == nil
      balance -= entry[:withdraw].to_i if entry[:deposit] == nil
    end 
    (balance - amount) < 0
  end
end
