;; getelget - el-get boostrap script
;;
;; Checks to see if el-get has been checked out, and bootstraps it if
;; it has not. After bootstrapping, calls el-get to load specified
;; packages.
;;
;; el-get-packages should be defined before including this file. Any
;; definitions from el-get-sources will be appended to el-get-packages.
;;
;; Written in 2011 by Nathan R. Yergler <nathan@yergler.net>
;;
;; To the extent possible under law, the person who associated CC0 with
;; getelget has waived all copyright and related or neighboring rights
;; to getelget.
;;
;; You should have received a copy of the CC0 legalcode along with this
;; work.  If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

;; add a hook listener for post-install el-get
(defun post-install-hook (pkg)
  ;; after installing el-get, load the local package list
  (if (string-equal pkg "el-get")
	(el-get 'sync
              (append el-get-packages
                      (mapcar 'el-get-source-name el-get-sources)))))
(add-hook 'el-get-post-install-hooks 'post-install-hook)

;; add the el-get directory to the load path
(add-to-list 'load-path (concat el-get-dir "el-get/"))

;; try to require el-get
(if (eq (require 'el-get nil t) nil)

    ;; urp, need to bootstrap
    (url-retrieve
     "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
     (lambda (s)
         (end-of-buffer)
         (eval-print-last-sexp)))

    ;; successfully required el-get, load the packages!
    (post-install-hook "el-get")
)
