class Printer
  def self.print_statement(statement)
    header + body(statement)
  end 

  class << self

    private

    def header
      "date || credit || debit || balance"
    end   

    def body(statement)
      transactions = ''

      statement.log.reverse.each do |transaction|
        transactions += "\n#{transaction[:date].strftime("%d/%m/%Y")} || #{transaction[:deposit]} || #{transaction[:withdraw]} || #{transaction[:balance]}"
      end
      transactions
    end
  end
end