require_relative 'printer'
require_relative 'statement'

class Account
  attr_reader :statement

  def initialize(statement = Statement.new)
    @statement = statement
  end

  def deposit(amount)
    raise 'Invalid input. Please try again.' unless valid_input?(amount)

    statement.record_transaction(amount)
  end

  def withdraw(amount)
    raise 'Invalid input. Please try again.' unless valid_input?(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)

    negative_amount = (amount * -1)
    statement.record_transaction(negative_amount)
  end

  private

  def valid_input?(amount)
    amount.is_a?(Integer) || amount.is_a?(Float)
  end

  def insufficient_funds?(amount)
    (statement.current_balance - amount) < 0
  end
end