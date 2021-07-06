require 'date'

class Statement
  attr_reader :log

  def initialize
    @log = []
  end

  def deposit_entry(amount, balance)
    log << {
      date: Date.today,
      deposit: amount,
      withdraw: nil,
      balance: balance
    }
  end

  def withdraw_entry(amount, balance)
    log << {
      date: Date.today,
      deposit: nil,
      withdraw: amount,
      balance: balance
    }
  end
end
