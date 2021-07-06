class Printer
  def self.print_statement(statement)
    transactions = ''

    statement.log.each do |transaction|
      transactions += "\n#{transaction[:date]} || #{transaction[:deposit]} || #{transaction[:withdraw]} || #{transaction[:balance]}"
    end

    "date || credit || debit || balance" + transactions
  end

  def self.print_balance(statement)
    "Balance: #{statement.log.first[:balance]}"
  end
end
