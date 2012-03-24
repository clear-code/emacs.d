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
  "Source for browse and insert Log-edit messages.")

(defun anything-c-log-edit-messages-candidates ()
  (let* ((candidates
          (shell-command-to-string "\\git \\log -5 --format=\"%x00%B\""))
         (logs (string-to-list (split-string candidates "\0"))))
    logs))

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
