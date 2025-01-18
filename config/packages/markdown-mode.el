;;; Copyright (C) 2012-2025  Sutou Kouhei <kou@clear-code.com>
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

;;; markdown-mode
;; Markdown編集用のモード
;; 2012-10-15

(use-package markdown-mode
  :hook (markdown-mode
         .
         (lambda ()
           ;; デフォルトでインライン画像を表示する
           ;; 2019-12-25
           (markdown-toggle-inline-images))))
