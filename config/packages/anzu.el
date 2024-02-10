;;; Copyright (C) 2013  Kouhei Sutou <kou@clear-code.com>
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

;;; anzu
;;; 置換対象をプレビューできる
;;; 2013-12-31

(package-ensure-install 'anzu)

;; デフォルトで有効にする。
(global-anzu-mode 1)

;; モードラインに" Anzu"と表示しない。
;; 2018-01-10
(setq anzu-mode-lighter "")

;; ヒット数のカウントを最大値を設定して大量にマッチしても重くならないようにする。
;; 2018-01-10
(setq anzu-search-threshold 1000)

;; Migemoサポートを有効にする。
;; 2018-01-10
(setq anzu-use-migemo t)

;; 標準の置換コマンドを置き換える。
(keymap-set global-map "M-%"   'anzu-query-replace)
(keymap-set global-map "C-M-%" 'anzu-query-replace-regexp)

;; カーソルのある場所にある単語をカーソルのある範囲内でだけ置換する。
;; 2018-01-10
(keymap-set global-map "ESC M-%" 'anzu-query-replace-at-cursor-thing)
