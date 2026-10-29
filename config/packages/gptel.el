;;; Copyright (C) 2025-2026  Sutou Kouhei <kou@clear-code.com>
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

;;; gptel
;;; 2025-10-02

;; 2026-10-27
(defvar local-gptel-make-backend nil
  "gptelのバックエンドを返す関数。このファイルを読み込む前に設定する。
gptelを読み込んだ後に引数なしで呼ばれる。例:

  (lambda ()
    (gptel-make-openai \"llama-cpp\"
      :stream t
      :protocol \"http\"
      :host \"localhost:8080\"
      :models \\='(llama-cpp-model)))

バックエンドの最初のモデルを使う。")

(use-package gptel
  :config
  (when local-gptel-make-backend
    (setq gptel-backend (funcall local-gptel-make-backend))
    (setq gptel-model (car (gptel-backend-models gptel-backend))))
  :bind (("C-c C-l" . gptel-menu)))

;; 翻訳
;; 2026-10-28
(defun translate-guess-target-language ()
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

(defvar translate-target-language (translate-guess-target-language)
  "翻訳先の言語。")

(defvar translate-system-prompt
  "Translate the following text into %s. \
Output only the translation."
  "翻訳に使うシステムプロンプト。
%sは`translate-target-language'に置き換わる。")

(defvar translate-buffer-name "*Translation*"
  "翻訳結果を表示するバッファー名。")

(defun translate-string (string)
  "STRINGをgptelで翻訳して別バッファーに表示する。"
  (require 'gptel)
  (let ((buffer (get-buffer-create translate-buffer-name)))
    ;; 翻訳中のものがあったら止める
    (gptel-abort buffer)
    (with-current-buffer buffer
      (let ((inhibit-read-only t))
        (erase-buffer))
      ;; qで元のウィンドウに戻れるようにする
      (special-mode))
    (pop-to-buffer buffer)
    ;; 翻訳ではWeb検索などのツールを使わない
    (let ((gptel-use-tools nil))
      (gptel-request string
        :buffer buffer
        :stream t
        :system (format translate-system-prompt translate-target-language)
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
                                  (plist-get info :status)))))))))))))

(defun translate-region (start end)
  "リージョンをgptelで翻訳して別バッファーに表示する。"
  (interactive "r")
  (translate-string (buffer-substring-no-properties start end)))

(keymap-set global-map "C-c C-t" #'translate-region)
