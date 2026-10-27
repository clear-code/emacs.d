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
(defun mew-translate-guess-target-language ()
  "言語環境（ロケールから決まる）から翻訳先の言語を推測する。"
  (let ((language current-language-environment))
    (cond
     ((string-match-p "\\`Chinese-GB" language) "Simplified Chinese")
     ((string-match-p "\\`Chinese-" language) "Traditional Chinese")
     ;; 言語ではなく文字コードの名前の場合
     ((or (member language '("ASCII" "UTF-8"))
          (string-match-p "\\`Latin-" language))
      "English")
     (t language))))

(defvar mew-translate-target-language (mew-translate-guess-target-language)
  "翻訳先の言語。")

(defvar mew-translate-system-prompt
  "Translate the following email body into %s. \
Output only the translation."
  "翻訳に使うシステムプロンプト。
%sは`mew-translate-target-language'に置き換わる。")

(defvar mew-translate-buffer-name "*Mew translation*"
  "翻訳結果を表示するバッファー名。")

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
  (require 'gptel)
  (if (mew-summary-or-virtual-p)
      (mew-summary-display 'redisplay))
  (let ((body (mew-translate-message-body))
        (buffer (get-buffer-create mew-translate-buffer-name)))
    ;; 翻訳中のものがあったら止める
    (gptel-abort buffer)
    (with-current-buffer buffer
      (let ((inhibit-read-only t))
        (erase-buffer))
      ;; qで元のウィンドウに戻れるようにする
      (special-mode))
    (pop-to-buffer buffer)
    (gptel-request body
      :buffer buffer
      :stream t
      :system (format mew-translate-system-prompt
                      mew-translate-target-language)
      :callback
      (lambda (response info)
        (with-current-buffer (plist-get info :buffer)
          (let ((inhibit-read-only t))
            (save-excursion
              (goto-char (point-max))
              (cond
               ((stringp response)
                (insert response))
               ((eq response t)
                (message "Translated"))
               ((null response)
                (insert (format "\n[翻訳失敗: %s]\n"
                                (plist-get info :status))))))))))))

;; Summaryモード・Messageモードで"T"を押すと翻訳する
(defun mew-enable-translate-message ()
  (keymap-set mew-summary-mode-map "T" 'mew-translate-message)
  (keymap-set mew-message-mode-map "T" 'mew-translate-message))

(with-eval-after-load 'mew-key
  (mew-enable-translate-message))
