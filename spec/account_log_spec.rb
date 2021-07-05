require 'account_log'

describe AccountLog do
  let(:account) { described_class.new }

  context "#update" do
    before { account.update(50, 100) }

    it "logs the date of a transaction" do 
      expect(account.log.first[:date]).to eq("2021-07-05")
    end

    it "logs the amount of the transation" do 
      expect(account.log.first[:amount]).to eq(50)
    end

    it "logs the balance after a transation" do 
      expect(account.log.first[:balance]).to eq(100)
    end
  end
end