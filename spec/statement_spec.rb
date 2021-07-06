require 'statement'

describe Statement do
  let(:statement) { described_class.new }

  context '#update' do
    before do
      allow(Date).to receive(:today).and_return('2021-07-05')
      statement.entry(50, 100)
    end

    it 'logs the date of a transaction' do
      expect(statement.log.first[:date].to_s).to eq('2021-07-05')
    end

    it 'logs the amount of the transation' do
      expect(statement.log.first[:amount]).to eq(50)
    end

    it 'logs the balance after a transation' do
      expect(statement.log.first[:balance]).to eq(100)
    end
  end
end
