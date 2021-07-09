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
    log.inject(0) { |result, element| result + element[:transaction] }
  end
end
