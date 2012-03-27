;;; text-mode
;; テキスト編集用のモード
;; 2012-03-18

;; text-modeでバッファーを開いたときに行う設定
(add-hook
 'text-mode-hook
 (lambda ()
   ;; スペースでインデントする
   (setq indent-tabs-mode nil)))
