class Printer
  def self.print_statement(statement)
    header + body(statement)
  end

  class << self
    private

    def header
      'date || credit || debit || balance'
    end

    def body(statement)
      transactions = ''

      statement.log.reverse.each do |transaction|
        transactions += "\n#{format_date(transaction)} || #{format_transaction(transaction)} || #{format_currency(transaction[:balance])}"
      end
      transactions
    end

    def format_date(transaction)
      transaction[:date].strftime('%d/%m/%Y')
    end

    def format_transaction(transaction)
      if transaction[:transaction].to_i >= 0
        "#{format_currency(transaction[:transaction])} || "
      else
        " || #{format_currency(transaction[:transaction].to_i.abs)}"
      end
    end

    def format_currency(amount)
      format('%.2f', amount)
    end
  end
end
