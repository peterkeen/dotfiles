(defun ledger-db ()
  (interactive)
  (let ((sql-database "ledger")
        (sql-server "lionel.local")
        (sql-user "ledger"))
    (sql-postgres)))

(defun okapi-db ()
  (interactive)
  (let ((sql-database "okapi")
        (sql-server "lionel.local")
        (sql-user "okapi"))
    (sql-postgres)))

(require-el-get
 '(:name ledger-new
         :type git
         :options ("xzf")
         :load-path ("lisp")
         :url "https://github.com/ledger/ledger.git"
         :autoloads nil))

(post-init (lambda ()
    (load "~/.el-get/ledger-new/lisp/ldg-new")
    (setenv "LEDGER_FILE" "~/financials/ledger.txt")))

