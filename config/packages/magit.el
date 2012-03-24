;;; Magit
;;; 2012-03-23

(el-get 'sync '(magit))

;; コミットメッセージをanythingで挿入できるようにする
(defvar anything-c-source-commit-messages
  '((name . "Commit Messages")
    (candidates . anything-c-commit-messages-candidates)
    (action . (("Insert" . (lambda (str) (insert str)))))
    (migemo))
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

(defun anything-show-commit-messages ()
  "`anything' for commit message."
  (interactive)
  (anything-other-buffer 'anything-c-source-commit-messages
                         "*anything commit messages*"))

(defun magit-enable-anything ()
  ;; commit messageの編集時にanythingでgit logのコメントから選択
  (define-key magit-log-edit-mode-map (kbd "C-c i") 'anything-show-commit-messages))

(add-hook 'magit-mode-hook
          'magit-enable-anything)
