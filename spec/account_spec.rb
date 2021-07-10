require 'account'

describe Account do
  let(:statement) { double(:statement) }
  let(:account) { described_class.new(statement) }

  before do
    allow(statement).to receive(:current_balance).and_return(100)
  end

  context '#deposit' do
    it 'raises an error if input isnt a float or integer' do
      expect { account.deposit('onehundred') }.to raise_error('Invalid input. Please try again.')
    end

    it 'runs statement.record_transaction if no exceptions are raised' do
      expect(statement).to receive(:record_transaction).with(50)
      account.deposit(50)
    end
  end

  context '#withdraw' do
    it 'raises an error if a withdrawal would set the balance below 0' do
      expect { account.withdraw(101) }.to raise_error('Insufficient funds')
    end

    it 'raises an error if input isnt a float or integer' do
      expect { account.withdraw('onehundred') }.to raise_error('Invalid input. Please try again.')
    end

    it 'turns the amount negative and runs statement.record_transaction if no exceptions are raised' do
      expect(statement).to receive(:record_transaction).with(-50)
      account.withdraw(49)
    end
  end
end
