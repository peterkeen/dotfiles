(require 'json)
(require 'url)

(defun get-json (url)
  (let ((buffer (url-retrieve-synchronously url))
        (json nil))
    (save-excursion
      (set-buffer buffer)
      (goto-char (point-min))
      (re-search-forward "^$" nil 'move)
      (setq json (buffer-substring-no-properties (point) (point-max)))
      (kill-buffer (current-buffer)))
    json))

(defun get-and-parse-json (url)
  (let ((json-object-type 'plist))
    (json-read-from-string 
     (get-json url))))

(defun bhelp-listify (arg)
  "Convert any remaining vector into a list"
  (mapcar (lambda (x) (if (or (vectorp x) (listp x))
                          (bhelp-listify x)
                        x)) arg))