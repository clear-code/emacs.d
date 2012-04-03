;;; Magit
;;; 2012-03-23

(el-get 'sync '(magit))

;; コミットメッセージをanythingで挿入できるようにする
(defvar anything-c-source-git-commit-messages
  '((name . "Git Commit Messages")
    (candidates . anything-c-git-commit-messages-candidates)
    (action . (("Insert" . (lambda (str) (insert str)))))
    (migemo)
    (multiline))
  "Source for browsing and inserting commit messages.")

(defun anything-c-git-commit-messages-candidates ()
  (let* ((messages-string
          (shell-command-to-string "\\git \\log -50 --format=\"%x00%B\""))
         (raw-messages (string-to-list (split-string messages-string "\0")))
         (messages (mapcar (lambda (raw-message)
                             (string-strip raw-message))
                           raw-messages)))
    (remove-if (lambda (message)
                 (string-equal message ""))
               messages)))

(defun anything-git-commit-messages ()
  "`anything' for git commit messages."
  (interactive)
  (anything-other-buffer 'anything-c-source-git-commit-messages
                         "*anything commit messages*"))

(defun magit-enable-anything ()
  ;; 過去のコミットメッセージを挿入
  (define-key magit-log-edit-mode-map
    (kbd "C-c i") 'anything-git-commit-messages))
(add-hook 'magit-mode-hook
          'magit-enable-anything)

;; diff関連の設定
;; 2012-04-02
(defun magit-setup-diff ()
  ;; diffを表示しているときに文字単位での変更箇所も強調表示する
  ;; 'allではなくtにすると現在選択中のhunkのみ強調表示する
  ;; 2012-04-02
  (setq magit-diff-refine-hunk 'all)
  ;; diff用のfaceを設定する
  ;; 2012-04-02
  (diff-mode-setup-faces)
  ;; diffの表示設定が上書きされてしまうのでハイライトを無効にする
  ;; 2012-04-02
  (set-face-attribute 'magit-item-highlight nil :inherit nil))
(add-hook 'magit-mode-hook 'magit-setup-diff)
