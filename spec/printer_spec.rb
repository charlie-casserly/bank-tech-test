require 'printer'

describe Printer do
  let(:printer) { described_class.new }

  it 'prints a bank statement after one deposit' do
    statement = Statement.new
    statement.deposit_entry(1000.0, 1000.0)

    expect(printer.print_statement(statement)).to eq(
      "date || credit || debit || balance\n2021-07-06 || 1000.0 ||  || 1000.0"
      )
  end

  it 'prints a bank statement after one deposit and one withdrawal' do
    statement = Statement.new
    statement.deposit_entry(1000.0, 1000.0)
    statement.withdraw_entry(600.0, 400.0)

    expect(printer.print_statement(statement)).to eq(
      "date || credit || debit || balance\n2021-07-06 || 1000.0 ||  || 1000.0\n2021-07-06 ||  || 600.0 || 400.0"
    )
  end
end
