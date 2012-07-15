export LEDGER_FILE=~/financials/ledger.txt

alias bal='ledger bal assets:schwab:checking liabilities:amex'
alias clr='ledger bal --cleared --real assets:schwab:checking liabilities:amex'
alias ucl='ledger reg --uncleared assets:schwab:checking liabilities:amex'
