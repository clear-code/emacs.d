;;; multiple-cursors
;;; 複数箇所を同時に編集する
;;; 2012-12-05

(el-get 'sync '(multiple-cursors))

(define-key global-map (kbd "C-[ M-C-e") 'mc/edit-lines)

(define-key global-map (kbd "<C-right>") 'mc/mark-next-like-this)
(define-key global-map (kbd "<C-left>") 'mc/mark-previous-like-this)
(define-key global-map (kbd "<C-down>") 'mc/mark-all-like-this)
