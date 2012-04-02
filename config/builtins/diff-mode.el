;;; diff-mode
;;; diffを表示、編集するためのモード
;;; 2012-04-02

;; diffの表示方法を変更
;; 2012-04-02
(defun diff-mode-setup-faces ()
  ;; 追加された行は緑で表示
  ;; 2012-04-02
  (set-face-attribute 'diff-added nil
                      :foreground "white" :background "dark green")
  ;; 削除された行は赤で表示
  ;; 2012-04-02
  (set-face-attribute 'diff-removed nil
                      :foreground "white" :background "dark red")
  ;; 文字単位での変更箇所は「色の反転」+「囲み表示」で強調
  ;; 2012-04-02
  (set-face-attribute 'diff-refine-change nil
                      :foreground nil :background nil
                      :weight 'bold :inverse-video t :box t))

(add-hook 'diff-mode-hook 'diff-mode-setup-faces)
