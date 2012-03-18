;;; text-mode
;; テキスト編集用のモード
;; 2012-03-18

;; text-modeでバッファーを開いたときに行う設定
(add-hook
 'text-mode-hook
 (lambda ()
   ;; 自動で長過ぎる行を分割する
   (auto-fill-mode 1)

   ;; 随時スペルチェックをする
   (flyspell-mode 1)))
