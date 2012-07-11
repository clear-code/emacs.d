;;; ruby-mode
;;; 2012-03-15

;; Emacsにバンドルされているruby-modeは古いのでRubyのリポジ
;; トリに入っているものを使う。
(el-get 'sync '(ruby-mode-trunk))

(add-hook 'ruby-mode-hook
          (lambda ()
            ;; C-M-pとC-M-nをすでに
            ;; previous-multiframe-windowとnext-multiframe-windowに
            ;; 割り当てているが
            ;; ruby-beginning-of-blockとruby-end-of-blockが
            ;; 上書きしてしまうので無効にする。
            ;; 2012-07-11
            (define-key ruby-mode-map (kbd "C-M-p") nil)
            (define-key ruby-mode-map (kbd "C-M-n") nil)))
