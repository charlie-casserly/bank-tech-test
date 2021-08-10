require 'account'

describe 'feature tests' do
  context 'printing' do
    it 'makes some deposits and withdrawals and then prints all transactions made on the account through reading the information on its statement' do
      account = Account.new
      test_date = DateTime.new(2021, 7, 5)
      Timecop.freeze(test_date)

      account.deposit(50)
      account.withdraw(40)
      account.deposit(100)

      expect{Printer.print_statement(account.statement)}.to output(
        "date || credit || debit || balance\n05/07/2021 || 100.00 ||  || 110.00\n05/07/2021 ||  || 40.00 || 10.00\n05/07/2021 || 50.00 ||  || 50.00"
      ).to_stdout
    end
  end
end
