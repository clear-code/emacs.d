;;; expand-region
;;; インクリメンタルに選択範囲を広げる
;;; 2012-12-06

(el-get 'sync '(expand-region))

(define-key global-map (kbd "C-=") 'er/expand-region)
