;;; iBus
;; 入力メソッド
;; 2012-03-16
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)
(ibus-define-common-key (kbd "C-SPC") nil)
(ibus-define-common-key (kbd "C-/") nil)
(define-key global-map (kbd "C-o") 'ibus-toggle)
