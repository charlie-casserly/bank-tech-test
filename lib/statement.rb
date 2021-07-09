require 'date'

class Statement
  attr_reader :log

  def initialize
    @log = []
  end

  def record_transaction(amount)
    log << {
      date: DateTime.now,
      transaction: amount,
      balance: current_balance + amount
    }
  end

  def current_balance
    balance = 0
    @log.each do |entry|
      balance += entry[:transaction].to_i
    end 
    return balance
  end
end

