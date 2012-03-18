;;; バージョン管理システム
;; diredから適切なバージョン管理システムの*-statusを起動
(defun dired-vc-status (&rest args)
  (interactive)
  (cond ((file-exists-p (concat (dired-current-directory) ".svn"))
         (svn-status (dired-current-directory)))
        ((file-exists-p (concat (dired-current-directory) ".git"))
         (magit-status (dired-current-directory)))
        (t
         (message "version controlled?"))))
(define-key dired-mode-map "V" 'dired-vc-status)


;;; 警告
;; 2011-03-01
(require 'warnings)


;;; スペルチェック
;; 2011-03-09
(setq-default flyspell-mode t)
(setq ispell-dictionary "american")


;;; cc-mode
;; 2012-03-18
(load "config/builtins/cc-mode")


;;; emacs-lisp-mode
;; 2012-03-18
(load "config/builtins/emacs-lisp-mode")


;;; 追加の設定
;; 個別の設定があったら読み込む
;; 2012-03-18
(condition-case err
    (load "config/builtins/local")
  (error))
