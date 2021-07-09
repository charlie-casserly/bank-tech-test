require 'account'

describe Account do
  let(:statement) do
    double(:statement, log: [
             {
               date: nil,
               deposit: 0,
               withdraw: 0,
               balance: 0
             }
           ])
  end
  let(:account) { described_class.new(statement) }

  before { allow(statement).to receive(:current_balance).and_return(0) }

  context '#deposit' do
    it 'raises an error if input isnt a float or integer' do
      expect { account.deposit('onehundred') }.to raise_error('Invalid input. Please try again.')
    end
  end

  context '#withdraw' do
    it 'raises an error if a withdrawal would set the balance below 0' do
      expect { account.withdraw(1) }.to raise_error('Insufficient funds')
    end

    it 'raises an error if input isnt a float or integer' do
      expect { account.withdraw('onehundred') }.to raise_error('Invalid input. Please try again.')
    end
  end
end
