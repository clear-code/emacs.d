;;; emacs-lisp-mode
;; Elisp用の設定
;; 2012-03-18

;; emacs-lisp-modeでバッファーを開いたときに行う設定
(add-hook
 'emacs-lisp-mode-hook
 (lambda ()
   ;; スペースでインデントをする
   (setq indent-tabs-mode nil)))
