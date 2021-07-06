require 'statement'

describe Statement do
  let(:statement) { described_class.new }

  context '#deposit_entry' do
    before do
      allow(Date).to receive(:today).and_return('2021-07-05')
      statement.deposit_entry(50, 100)
    end

    it 'logs the date of a deposit' do
      expect(statement.log.first[:date].to_s).to eq('2021-07-05')
    end

    it 'logs the amount of the deposit' do
      expect(statement.log.first[:deposit]).to eq(50)
    end

    it 'logs the balance after a deposit' do
      expect(statement.log.first[:balance]).to eq(100)
    end
  end

  context '#withdraw_entry' do
    before do
      allow(Date).to receive(:today).and_return('2021-07-05')
      statement.withdraw_entry(50, 100)
    end

    it 'logs the date of a deposit' do
      expect(statement.log.first[:date].to_s).to eq('2021-07-05')
    end

    it 'logs the amount of the deposit' do
      expect(statement.log.first[:withdraw]).to eq(50)
    end

    it 'logs the balance after a deposit' do
      expect(statement.log.first[:balance]).to eq(100)
    end
  end
end
