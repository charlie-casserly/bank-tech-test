require 'date'

class AccountLog
  attr_reader :log

  def initialize
    @log = []
  end

  def update(amount, balance)
    log << { 
      date: Date.today,
      amount: amount,
      balance: balance
    }
  end
end