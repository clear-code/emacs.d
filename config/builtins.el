;;; バージョン管理システム
;; diredから適切なバージョン管理システムの*-statusを起動
(defun dired-vc-status (&rest args)
  (interactive)
  (let ((path (find-path-in-parents (dired-current-directory)
                                    '(".svn" ".git"))))
    (cond ((null path)
           (message "not version controlled."))
          ((string-match-p "\\.svn$" path)
           (svn-status (file-name-directory path)))
          ((string-match-p "\\.git$" path)
           (magit-status (file-name-directory path))))))
(define-key dired-mode-map "V" 'dired-vc-status)


;;; スペルチェック
;;; 2011-03-09

;; M-TABのキーバインドを変更しない
;; 2011-03-27
(setq flyspell-use-meta-tab nil)
;; デフォルトで自動スペルチェック機能を有効にする
(setq-default flyspell-mode t)
;; スペルチェックには英語の辞書を使う
(setq ispell-dictionary "american")

;;; diff-mode
;;; 2012-04-02
(load "config/builtins/diff-mode")


;;; text-mode
;; 2012-03-18
(load "config/builtins/text-mode")


;;; cc-mode
;; 2012-03-18
(load "config/builtins/cc-mode")


;;; emacs-lisp-mode
;; 2012-03-18
(load "config/builtins/emacs-lisp-mode")


;;; 追加の設定
;; 個別の設定があったら読み込む
;; 2012-03-18
(load "config/builtins/local" t)
