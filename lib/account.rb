require_relative 'printer'
require_relative 'statement'

class Account
  attr_reader :statement, :printer

  def initialize(statement = Statement.new, printer = Printer.new)
    @printer = printer
    @statement = statement
    @balance = 0
  end

  def deposit(amount)
    raise 'Invalid input. Please try again.' unless valid_input?(amount)

    @balance += amount
    statement.deposit_entry(amount, balance)
  end

  def withdraw(amount)
    raise 'Invalid input. Please try again.' unless valid_input?(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)

    @balance -= amount
    statement.withdraw_entry(amount, balance)
  end

  def show_balance
    balance
  end

  private

  attr_reader :balance

  def valid_input?(amount)
    amount.is_a?(Integer) || amount.is_a?(Float)
  end

  def insufficient_funds?(amount)
    balance - amount < 0
  end
end
