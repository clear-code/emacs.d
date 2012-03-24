;;; Magit
;;; 2012-03-23

(el-get 'sync '(magit))

;; コミットメッセージをanythingで挿入できるようにする
(defvar anything-c-source-commit-messages
  '((name . "Commit Messages")
    (candidates . anything-c-commit-messages-candidates)
    (action . (("Insert" . (lambda (str) (insert str)))))
    (migemo)
    (multiline))
  "Source for browsing and inserting commit messages.")

(defun anything-c-commit-messages-candidates ()
  (let* ((messages-string
          (shell-command-to-string "\\git \\log -50 --format=\"%x00%B\""))
         (raw-messages (string-to-list (split-string messages-string "\0")))
         (messages (mapcar (lambda (raw-message)
                             (string-strip raw-message))
                           raw-messages)))
    (remove-if (lambda (message)
                 (string-equal message ""))
               messages)))

(defun anything-commit-messages ()
  "`anything' for commit messages."
  (interactive)
  (anything-other-buffer 'anything-c-source-commit-messages
                         "*anything commit messages*"))

(defun magit-enable-anything ()
  ;; 過去のコミットメッセージを挿入
  (define-key magit-log-edit-mode-map (kbd "C-c i") 'anything-commit-messages))

(add-hook 'magit-mode-hook
          'magit-enable-anything)
