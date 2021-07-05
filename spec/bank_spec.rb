require 'bank'

describe Bank do 
  let(:account_log) {double("AccountLog")}
  let(:bank) { described_class.new(account_log) }

  context '#show_balance' do 
    it 'a new bank object initializes with a balance of 0' do 
      expect(bank.show_balance).to eq(0)
    end
  end

  context '#deposit' do 
    before do 
      allow(account_log).to receive(:update) 
    end

    it 'allows a user to deposit money and adds the amount to the balance' do 
      bank.deposit(100.00)
      expect(bank.show_balance).to eq (100.00)
    end

    it 'raises an error if input isnt a float or integer' do 
      expect{ bank.deposit('onehundred') }.to raise_error('Invalid input. Please try again.')
    end
  end

  context '#withdraw' do 
    before do 
      allow(account_log).to receive(:update) 
      bank.deposit(100.00) 
    end

    it 'removes withdrawn money from the balance' do 
      bank.withdraw(50.00)
      expect(bank.show_balance).to eq(50.00) 
    end

    it "raises an error if a withdrawal would set the balance below 0" do 
      expect{ bank.withdraw(101.00) }.to raise_error('Insufficient funds')
    end

    it 'raises an error if input isnt a float or integer' do 
      expect{ bank.withdraw('onehundred') }.to raise_error('Invalid input. Please try again.')
    end
  end
end