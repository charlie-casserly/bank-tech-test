require 'bank'

describe Bank do 
  let(:bank) { described_class.new }

  context '#deposit' do 
    it 'allows a user to deposit money and adds the amount to the balance' do 
      bank.deposit(100)
      expect(bank.balance).to eq (100)
    end

    it 'raises an error if input isnt a float or integer' do 
      expect{ bank.deposit('onehundred') }.to raise_error('Invalid input. Please try again.')
    end
  end

  context '#withdraw' do 
    it 'removes withdrawn money from the balance' do 
      bank.deposit(100)
      bank.withdraw(50)
      expect(bank.balance).to eq(50) 
    end
  end
end