;;; 文字列
;;; 2012-03-24

;; 文字列の先頭と最後にある一連の空白をすべて削除する
;; 2012-03-24
(defun string-strip (string)
  (replace-regexp-in-string "\\`[ \r\n]*\\|[ \r\n]*\\'" "" string))
