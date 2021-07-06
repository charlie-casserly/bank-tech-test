require 'date'

class Statement
  attr_reader :log

  def initialize
    @log = []
  end

  def entry(amount, balance)
    log << {
      date: Date.today,
      amount: amount,
      balance: balance
    }
  end
end
