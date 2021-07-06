# Super Cool Bank App

Super Cool Bank App is a program that allows the user to deposit and withdraw cash from a digital account. So that a user can keep track of their finances, the users balance and transaction history is stored and can be viewed within the application.

## Installation and Super Cool Bank App launching steps 

1. Clone this repo
1. cd into your local clone
1. In your terminal, run 'irb -r './lib/account.rb'

## How to use Super Cool Bank App

In IRB, type 'account = Account.new' to create a new Account object simply named *account*. Listed below are some methods you can call on this object or other Classes in the application.

**Making a cash deposit**
* account.deposit(amount)
 * *examples*
   account.deposit(50) - deposits £50 into the account
   account.deposit(99.99) - deposits £99.99 into the account

**Making a cash withdrawal**
* account.withdraw(amount)
  * *examples*
    account.withdraw(10) - withdraws £10 from the account
    account.withdraw(50) - withdraws £50 from the account 

*Withdrawals cannot be made that will set the accounts balance below £0*

**Viewing your current balance**
* Printer.print_balance(account.statement)
  This feature will print the current balance of the Account object given in the argument. In this case, that object is named *account*.

**Viewing your bank statement**
* Printer.print_statement(account.statement)
  This feature will print the bank statement of the Account object given in the argument. In this case, that object is named *account*.

## For Developers to install

1. Clone this repo 
1. cd into your local clone
1. run 'bundle install'