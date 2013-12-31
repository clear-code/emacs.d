;;; anzu
;;; 置換対象をプレビューできる
;;; 2013-12-31

(package-ensure-install 'anzu)

;; デフォルトで有効にする。
(global-anzu-mode 1)

;; 標準の置換コマンドを置き換える。
(define-key global-map (kbd "M-%")   'anzu-query-replace)
(define-key global-map (kbd "C-M-%") 'anzu-query-replace-regexp)
