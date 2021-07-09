require 'statement'

describe Statement do
  let(:statement) { described_class.new }

  describe '#record_transaction' do
    before do
      statement.record_transaction(50)
    end

    it 'logs a date for a deposit' do
      expect(statement.log.first[:date]).to be_a(DateTime)
    end

    it 'logs the amount of a transaction' do
      expect(statement.log.first[:transaction]).to eq(50)
    end

    it 'logs the balance after a deposit' do
      expect(statement.log.first[:balance]).to eq(50)
    end
  end

  describe '#current_balance' do 
    it 'sums the history of all transactions in the log' do 
      statement.record_transaction(50)
      statement.record_transaction(60)
      statement.record_transaction(100)
      statement.record_transaction(-20)

      expect(statement.current_balance).to eq(190)
    end
  end
end
