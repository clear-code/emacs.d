;;; Copyright (C) 2011-2012  Kouhei Sutou <kou@clear-code.com>
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

;;; uim
;; 入力メソッド
;; 2011-06-27
(require 'uim)
(uim-reset-keymap)
(defun uim-mode-force-on (&optional arg)
  (interactive "P")
  (if (and (= (prefix-numeric-value arg) 0)
           uim-mode)
      (ignore)
    (uim-mode)
    (uim-process-input)
    (load-library "uim-var")))
(setq uim-candidate-display-frame t)
(setq uim-candidate-display-inline t)
(keymap-set global-map "\C-o" 'uim-mode-force-on)
