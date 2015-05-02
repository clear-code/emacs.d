;;; scss-mode
;; 2014-10-22

(package-ensure-install 'scss-mode)

;; 別の仕組みを使ってコンパイルすることが多いので、
;; 保存時の自動コンパイルは無効にする。
(setq scss-compile-at-save nil)

(add-hook 'scss-mode-hook
          (lambda ()
            ;; インデントにはスペースを使う。
            (setq indent-tabs-mode nil)))
