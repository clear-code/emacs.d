;;; Copyright (C) 2012-2014  Kouhei Sutou <kou@clear-code.com>
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation, either version 3 of the License, or
;;; (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
