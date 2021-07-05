class Bank
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    raise "Invalid input. Please try again." unless valid_input?(amount)
    @balance += amount
  end

  private 

  def valid_input?(amount)
    amount.is_a?(Integer) || amount.is_a?(Float)
  end
end