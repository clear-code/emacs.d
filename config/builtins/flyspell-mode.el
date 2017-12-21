;;; Copyright (C) 2011-2013  Kouhei Sutou <kou@clear-code.com>
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

;;; flyspell-mode
;; スペルチェック
;; 2011-03-09

;; M-TABのキーバインドを変更しない
;; 2011-03-27
(setq flyspell-use-meta-tab nil)

;; テキスト編集時は自動スペルチェック機能を有効にする
;; 2013-12-19
(mapc
 (lambda (hook)
   (add-hook hook 'flyspell-mode))
 '(text-mode-hook))
;; プログラムを書いているときはコメントの中でだけ自動スペルチェック機能を有効にする
;; 2013-12-19
(mapc
 (lambda (hook)
   (add-hook hook 'flyspell-prog-mode))
 '(prog-mode-hook
   ruby-mode-hook))

;; スペルチェックには英語の辞書を使う
(setq ispell-dictionary "american")
