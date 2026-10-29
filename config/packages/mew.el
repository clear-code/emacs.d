;;; Copyright (C) 2026  Sutou Kouhei <kou@clear-code.com>
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

;;; Mew
;;; 2026-10-27

;; gptelで本文を翻訳する
;; config/packages/gptelのtranslate-stringを使う
(defun mew-translate-message-body ()
  "Messageバッファーの本文（ヘッダーを除く）を返す。"
  (with-current-buffer (if (mew-message-p)
                           (current-buffer)
                         (mew-buffer-message))
    (save-excursion
      (save-restriction
        (widen)
        (goto-char (point-min))
        (if (search-forward "\n\n" nil t)
            (buffer-substring-no-properties (point) (point-max))
          (error "No message body"))))))

(defun mew-translate-message ()
  "表示中のメールの本文をgptelで翻訳して別バッファーに表示する。"
  (interactive)
  (if (mew-summary-or-virtual-p)
      (mew-summary-display 'redisplay))
  (translate-string (mew-translate-message-body)))

;; Summaryモード・Messageモードで"T"を押すと翻訳する
(defun mew-enable-translate-message ()
  (keymap-set mew-summary-mode-map "T" #'mew-translate-message)
  (keymap-set mew-message-mode-map "T" #'mew-translate-message))

(with-eval-after-load 'mew-key
  (mew-enable-translate-message))
