require 'date'

class Statement
  attr_reader :log

  def initialize
    @log = []
  end

  def deposit_entry(amount, balance)
    log << {
      date: format_date,
      deposit: format_currency(amount),
      withdraw: nil,
      balance: format_currency(balance)
    }
  end

  def withdraw_entry(amount, balance)
    log << {
      date: format_date,
      deposit: nil,
      withdraw: format_currency(amount),
      balance: format_currency(balance)
    }
  end

  private 

  def format_currency(amount)
    sprintf("%.2f",(amount)).to_f
  end

  def format_date
    Date.today.strftime("%d/%m/%Y")
  end
end

