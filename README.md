# Super Cool Bank App

Super Cool Bank App is a program that allows the user to deposit and withdraw cash from a digital account. So that a user can keep track of their finances, the users balance and transaction history is stored and can be viewed within the application.

## Installation and Super Cool Bank App launching steps 

1. Clone this repo
1. cd into your local clone
1. In your terminal, run 'irb -r './lib/account.rb'
1. In IRB, type 'account = Account.new' to create a new Account object simply named *account*.

## How to use Super Cool Bank App

Listed below are some methods you can call in this application.

### Making a cash deposit
* *account.deposit(amount)*

   Examples:

   *account.deposit(50)* - deposits £50 into the account

   *account.deposit(99.99)* - deposits £99.99 into the account

### Making a cash withdrawal
* *account.withdraw(amount)*

  Examples:

  *account.withdraw(10)* - withdraws £10 from the account

  *account.withdraw(50)* - withdraws £50 from the account 

*__*Withdrawals cannot be made that will set the accounts balance below £0.*__*

### Viewing your current balance
* *Printer.print_balance(account.statement)*

  This feature will print the account's current balance.

### Viewing your bank statement
* *Printer.print_statement(account.statement)*

  This feature will print the account's bank statement.

## For Developers to install

1. Clone this repo 
1. cd into your local clone
1. run 'bundle install'
1. All tests can be run by typing 'rspec' in the terminal

### Notes on development
I wrote this program in Ruby and used a TDD development process to implement it's features. I had planned to develop the program with three Classes (Account, Statement, Printer), which I hope I was successful in doing so meaningfully. All outside dependencies were doubled and mocked in my testing and I achieved 100% test coverage.