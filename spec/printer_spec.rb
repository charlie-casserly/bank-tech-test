require 'printer'

describe Printer do
  context '#print_statement' do
  let(:test_time) { Time.local(2021, 7, 5) }
  before { Timecop.freeze(test_time) }

    it 'prints a detailed and formatted bank statement after one deposit' do
      statement = double(:statement, log: [
                           {
                             date: test_time,
                             deposit: "1000.00",
                             withdraw: nil,
                             balance: "1000.00"
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
                             deposit: "1000.00",
                             withdraw: nil,
                             balance: "1000.00"
                           },

                           {
                             date: test_time,
                             deposit: nil,
                             withdraw: "600.00",
                             balance: "400.00"
                           }
                         ])

      expect(Printer.print_statement(statement)).to eq(
        "date || credit || debit || balance\n05/07/2021 ||  || 600.00 || 400.00\n05/07/2021 || 1000.00 ||  || 1000.00"
      )
    end
  end
end
