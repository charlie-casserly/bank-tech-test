require 'account'

describe 'feature tests' do
  context 'depositing and withdrawing' do
    it 'transactions are accumulated and added into the statement' do
      account = Account.new

      account.deposit(50)
      account.withdraw(40)
      account.deposit(100)

      expect(account.statement.log.last[:balance]).to eq(110)
    end
  end

  context 'printing' do
    it 'prints all transactions made on an account through reading the information on its statement' do
      account = Account.new
      today = DateTime.now.strftime('%d/%m/%Y')

      account.deposit(50)
      account.withdraw(40)
      account.deposit(100)

      expect(Printer.print_statement(account.statement)).to eq(
        "date || credit || debit || balance\n#{today} || 100.00 ||  || 110.00\n#{today} ||  || 40.00 || 10.00\n#{today} || 50.00 ||  || 50.00"
      )
    end
  end
end
