require 'printer'

describe Printer do
  context '::print_statement' do
    let(:test_time) { DateTime.new(2021, 7, 5) }

    it 'prints a detailed and formatted bank statement after one deposit' do
      statement = double(:statement, log: [
                           {
                             date: test_time,
                             transaction: '1000',
                             balance: '1000'
                           }
                         ])

      expect(Printer.print_statement(statement)).to eq(
        "date || credit || debit || balance\n05/07/2021 || 1000.00 ||  || 1000.00"
      )
    end

    it 'prints a detailed and formatted bank statement after one deposit and one withdrawal' do
      statement = double(:statement, log: [
                           {
                             date: test_time,
                             transaction: '1000',
                             balance: '1000'
                           },

                           {
                             date: test_time,
                             transaction: '-600',
                             balance: '400'
                           }
                         ])

      expect(Printer.print_statement(statement)).to eq(
        "date || credit || debit || balance\n05/07/2021 ||  || 600.00 || 400.00\n05/07/2021 || 1000.00 ||  || 1000.00"
      )
    end
  end
end
