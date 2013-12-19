;;; flyspell-mode
;; スペルチェック
;; 2011-03-09

;; M-TABのキーバインドを変更しない
;; 2011-03-27
(setq flyspell-use-meta-tab nil)

;; テキスト編集時は自動スペルチェック機能を有効にする
;; 2013-12-19
(mapc
 (lambda (hook)
   (add-hook hook 'flyspell-mode))
 '(text-mode-hook))
;; プログラムを書いているときはコメントの中でだけ自動スペルチェック機能を有効にする
;; 2013-12-19
(mapc
 (lambda (hook)
   (add-hook hook 'flyspell-prog-mode))
 '(prog-mode-hook
   ruby-mode-hook))

;; スペルチェックには英語の辞書を使う
(setq ispell-dictionary "american")
