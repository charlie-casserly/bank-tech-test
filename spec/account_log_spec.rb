require 'account_log'

describe AccountLog do
  let(:account) { described_class.new }

  it "logs the date of a transaction" do 
    bank = Bank.new 

    bank.deposit(100)

    expect(account.log.first.date).to eq(2021,7,4)
  end
end