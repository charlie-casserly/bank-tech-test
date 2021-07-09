require 'date'

class Statement
  attr_reader :log

  def initialize
    @log = []
  end

  def record_deposit(amount)
    log << {
      date: DateTime.now,
      transaction: format_currency(amount),
      balance: format_currency(current_balance + amount)
    }
  end

  def record_withdrawal(amount)
    log << {
      date: DateTime.now,
      transaction: format_currency(amount),
      balance: format_currency(current_balance - amount)
    }
  end

  def current_balance
    balance = 0
    @log.each do |entry|
      balance += entry[:transaction].to_i
    end 
    return balance
  end

  private 

  def format_currency(amount)
    sprintf("%.2f",(amount))
  end

  
end

