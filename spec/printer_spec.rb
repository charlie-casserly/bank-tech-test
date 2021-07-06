require 'printer'

describe Printer do
  context '#print_statement' do 
    it 'prints a detailed and formatted bank statement after one deposit' do
      statement = double(:Statement, log: [
                          {
                            date: '2021-07-06',
                            deposit: 1000.0,
                            withdraw: nil,
                            balance: 1000.0
                          }
                        ])

      expect(Printer.print_statement(statement)).to eq(
        "date || credit || debit || balance\n2021-07-06 || 1000.0 ||  || 1000.0"
      )
    end

    it 'prints a detailed and formatted bank statement after one deposit and one withdrawal' do
      statement = double(:Statement, log: [
                          {
                            date: '2021-07-06',
                            deposit: 1000.0,
                            withdraw: nil,
                            balance: 1000.0
                          },

                          {
                            date: '2021-07-06', 
                            deposit: nil,
                            withdraw: 600.0,
                            balance: 400.0
                          }
                        ])

      expect(Printer.print_statement(statement)).to eq(
        "date || credit || debit || balance\n2021-07-06 || 1000.0 ||  || 1000.0\n2021-07-06 ||  || 600.0 || 400.0"
      )
    end
  end
  
  context '#print_balance' do 
    it 'prints the accounts current balance' do 
      statement = double(:Statement, log: [
                          {
                            balance: 50.0
                          }
                        ])
      expect(Printer.print_balance(statement)).to eq("Balance: 50.0")
    end
  end
end