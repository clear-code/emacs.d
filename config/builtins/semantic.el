;;; Copyright (C) 2014  Kouhei Sutou <kou@clear-code.com>
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

;;; Semantic
;; 各種プログラミング言語を解析するライブラリー。
;; コンテキストに応じた処理もできる。
;; 2014-05-06

;; 何も操作しないと現在のポイントにあるシンボルをハイライトする。
(add-to-list 'semantic-default-submodes
             'global-semantic-idle-local-symbol-highlight-mode)
;; 何も操作しないと現在のポイントにあるシンボルの情報をミニバッファーに表示する。
(add-to-list 'semantic-default-submodes
             'global-semantic-idle-summary-mode)
;; 表示されている内容の先頭行の関数名をバッファーのヘッダーに表示する。
(add-to-list 'semantic-default-submodes
             'global-semantic-stickyfunc-mode)

;; Semanticを有効にする。
(semantic-mode)
