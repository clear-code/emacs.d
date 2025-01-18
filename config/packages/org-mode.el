;;; Copyright (C) 2021-2025  Sutou Kouhei <kou@clear-code.com>
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

;;; Org mode
;;; 2021-01-29

(use-package ox-pandoc
  :config
  ;; pandocでPDFを生成する設定
  ;; 2021-01-29
  (setq org-pandoc-options-for-latex-pdf '((pdf-engine . "xelatex")))

  ;; デフォルトで行を折り返す
  ;; 2021-04-06
  (setq org-startup-truncated nil)

  ;; デフォルトで展開する
  ;; 2021-04-06
  (setq org-startup-folded nil))
