;;; Magit
;;; 2012-03-23

(el-get 'sync '(magit))

;; commit logをanythingで選択できるようにする
(defvar anything-c-source-log-edit-messages
  '((name . "Log-edit Messages")
    (candidates . anything-c-log-edit-messages-candidates)
    (action . (("Insert" . (lambda (str) (insert str)))))
    (migemo)
    (multiline))
  "Source for browsing and inserting Log-edit messages.")

(defun anything-c-log-edit-messages-candidates ()
  (let* ((messages-string
          (shell-command-to-string "\\git \\log -50 --format=\"%x00%B\""))
         (raw-messages (string-to-list (split-string messages-string "\0")))
         (messages (mapcar (lambda (raw-message)
                             (string-strip raw-message))
                           raw-messages)))
    (remove-if (lambda (message)
                 (string-equal message ""))
               messages)))

(defun anything-show-log-edit-messages ()
  "`anything' for Log-edit message."
  (interactive)
  (anything-other-buffer 'anything-c-source-log-edit-messages
                         "*anything log-edit messages*"))

(defun magit-enable-anything ()
  ;; commit messageの編集時にanythingでgit logのコメントから選択
  (define-key magit-log-edit-mode-map (kbd "C-s") 'anything-show-log-edit-messages))

(add-hook 'magit-mode-hook
          'magit-enable-anything)
