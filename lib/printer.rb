class Printer
  def self.print_statement(statement)
    printf header + body(statement)
  end

  class << self
    private

    def header
      'date || credit || debit || balance'
    end

    def body(statement)
      statement.log.reverse.map { |transaction| "\n#{format_date(transaction)} || #{format_transaction(transaction)} || #{format_currency(transaction[:balance])}" }.join('')
    end

    def format_date(transaction)
      transaction[:date].strftime('%d/%m/%Y')
    end

    def format_transaction(transaction)
      transaction[:transaction].to_i >= 0 ? format_credit(transaction) : format_debit(transaction)
    end

    def format_credit(transaction)
      "#{format_currency(transaction[:transaction])} || "
    end

    def format_debit(transaction)
      " || #{format_currency(transaction[:transaction].to_i.abs)}"
    end

    def format_currency(amount)
      format('%.2f', amount)
    end
  end
end
