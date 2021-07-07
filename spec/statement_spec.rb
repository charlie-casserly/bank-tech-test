require 'statement'

describe Statement do
  let(:statement) { described_class.new }
  let(:today) { DateTime.now.strftime("%d/%m/%Y") }

  context '#deposit_entry' do
    before do
      statement.deposit_entry(50, 100)
    end

    it 'converts integer input into a float in the log' do
      expect(statement.log.first[:deposit]).to be_a(Float)
    end

    it 'logs the date of a deposit' do
      expect(statement.log.first[:date].to_s).to eq(today)
    end

    it 'logs the amount of the deposit' do
      expect(statement.log.first[:deposit]).to eq(50.00)
    end

    it 'logs the balance after a deposit' do
      expect(statement.log.first[:balance]).to eq(100.00)
    end
  end

  context '#withdraw_entry' do
    before do
      statement.withdraw_entry(50, 100)
    end

    it 'converts integer input into a float in the log' do
      expect(statement.log.first[:withdraw]).to be_a(Float)
    end

    it 'logs the date of a deposit' do
      expect(statement.log.first[:date].to_s).to eq(today)
    end

    it 'logs the amount of the deposit' do
      expect(statement.log.first[:withdraw]).to eq(50.00)
    end

    it 'logs the balance after a deposit' do
      expect(statement.log.first[:balance]).to eq(100.00)
    end
  end
end
