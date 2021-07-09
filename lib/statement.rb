require 'date'

class Statement
  attr_reader :log

  def initialize
    @log = []
  end

  def record_deposit(amount)
    log << {
      date: DateTime.now,
      deposit: format_currency(amount),
      withdraw: nil,
      balance: format_currency(current_balance + amount)
    }
  end

  def record_withdrawal(amount)
    log << {
      date: DateTime.now,
      deposit: nil,
      withdraw: format_currency(amount),
      balance: format_currency(current_balance - amount)
    }
  end

  def current_balance
    balance = 0
    @log.each do |entry|
      balance += entry[:deposit].to_i if entry[:withdraw] == nil
      balance -= entry[:withdraw].to_i if entry[:deposit] == nil
    end 
    return balance
  end

  private 

  def format_currency(amount)
    sprintf("%.2f",(amount))
  end

  
end

