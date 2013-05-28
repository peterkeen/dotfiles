export LEDGER_FILE=~/financials/ledger.txt

alias bal='ledger bal assets:schwab:checking liabilities:amex liabilities:chase:sp'
alias clr='ledger bal --cleared --real assets:schwab:checking liabilities:amex liabilities:chase:sp'
alias ucl='ledger reg --uncleared assets:schwab:checking liabilities:amex liabilities:chase:sp'
alias bills='bills.py "peter.keen@gmail.com" "eni889@yahoo.com"'
