# spendingsClassifier

Manage your spendings with this simple Perl script.

Tags are written in Polish.

## Usage

Put your budget file in budget.csv.

Start: 

perl classify.pl > output.csv

Also useful in some cases:

tr -d '\15\32' < budget_csv.csv > budget.csv

