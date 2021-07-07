require 'statement'

describe Statement do
  let(:statement) { described_class.new }
  let(:today) { DateTime.now.strftime("%d/%m/%Y") }

  context '#record_deposit' do
    before do
      statement.record_deposit(50)
    end

    it 'logs the date of a deposit' do
      expect(statement.log.first[:date].to_s).to eq(today)
    end

    it 'logs the amount of the deposit' do
      expect(statement.log.first[:deposit]).to eq("50.00")
    end

    it 'logs the balance after a deposit' do
      expect(statement.log.first[:balance]).to eq("50.00")
    end
  end

  context '#record_withdraw' do
    before do
      statement.record_deposit(100)
      statement.record_withdrawal(50)
    end

    it 'logs the date of a withdrawal' do
      expect(statement.log[1][:date].to_s).to eq(today)
    end

    it 'logs the amount of the withdrawal' do
      expect(statement.log[1][:withdraw]).to eq("50.00")
    end

    it 'logs the balance after a withdrawal' do
      expect(statement.log[1][:balance]).to eq("50.00")
    end
  end
end
