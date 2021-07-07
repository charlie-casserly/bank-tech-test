require 'account'

describe Account do
  let(:statement) { double(:statement) }
  let(:account) { described_class.new(statement) }

  before do
    allow(statement).to receive(:deposit_entry)
    allow(statement).to receive(:withdraw_entry)
  end

  context '#balance' do
    it 'a new account object initializes with a balance of 0' do
      expect(account.balance).to eq(0)
    end
  end

  context '#deposit' do
    it 'allows a user to deposit money and adds the amount to the balance' do
      account.deposit(100.00)
      expect(account.balance).to eq(100.00)
    end

    it 'raises an error if input isnt a float or integer' do
      expect { account.deposit('onehundred') }.to raise_error('Invalid input. Please try again.')
    end
  end

  context '#withdraw' do
    before { account.deposit(100.00) }

    it 'removes withdrawn money from the balance' do
      account.withdraw(50.00)
      expect(account.balance).to eq(50.00)
    end

    it 'raises an error if a withdrawal would set the balance below 0' do
      expect { account.withdraw(101.00) }.to raise_error('Insufficient funds')
    end

    it 'raises an error if input isnt a float or integer' do
      expect { account.withdraw('onehundred') }.to raise_error('Invalid input. Please try again.')
    end
  end
end
