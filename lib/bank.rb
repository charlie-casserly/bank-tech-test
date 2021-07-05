require_relative 'printer'

class Bank

  def initialize
    @balance = 0
  end

  def deposit(amount)
    invalid_input_message unless valid_input?(amount)
    @balance += amount
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