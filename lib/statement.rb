require 'date'

class Statement
  attr_reader :log

  def initialize
    @log = []
  end

  def deposit_entry(amount, balance)
    log << {
      date: Date.today,
      deposit: amount.to_f.round(2),
      withdraw: nil,
      balance: balance.to_f.round(2)
    }
  end

  def withdraw_entry(amount, balance)
    log << {
      date: Date.today,
      deposit: nil,
      withdraw: amount.to_f.round(2),
      balance: balance.to_f.round(2)
    }
  end
end
