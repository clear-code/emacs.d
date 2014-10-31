;;; ruby-mode
;;; 2012-03-15

;; Emacsにバンドルされているruby-modeにはC-c C-eでendを挿入する機能が
;; なくなっているので、その機能だけ別途追加する。
;; 2014-10-28
(defun ruby-insert-end ()
  "Insert 'end'."
  (interactive)
  (insert "end")
  (ruby-indent-line))

(add-hook 'ruby-mode-hook
          (lambda ()
            ;; C-M-pとC-M-nをすでに
            ;; previous-multiframe-windowとnext-multiframe-windowに
            ;; 割り当てているが
            ;; ruby-beginning-of-blockとruby-end-of-blockが
            ;; 上書きしてしまうので無効にする。
            ;; 2012-07-11
            (define-key ruby-mode-map (kbd "C-M-p") nil)
            (define-key ruby-mode-map (kbd "C-M-n") nil)

            ;; C-c C-eで「end」を挿入する
            ;; 2014-10-28
            (define-key ruby-mode-map (kbd "C-C C-e") 'ruby-insert-end)))
