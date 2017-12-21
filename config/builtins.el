;;; Copyright (C) 2011-2017  Kouhei Sutou <kou@clear-code.com>
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

;;; dired
(load "config/builtins/dired")


;;; flyspell-mode
;;; 2011-03-09
(load "config/builtins/flyspell-mode")


;;; diff-mode
;;; 2012-04-02
(load "config/builtins/diff-mode")


;;; text-mode
;; 2012-03-18
(load "config/builtins/text-mode")


;;; cc-mode
;; 2012-03-18
(load "config/builtins/cc-mode")


;;; emacs-lisp-mode
;; 2012-03-18
(load "config/builtins/emacs-lisp-mode")


;;; Semantic
;; 2014-05-06
(load "config/builtins/semantic")


;;; 追加の設定
;; 個別の設定があったら読み込む
;; 2012-03-18
(load "config/builtins/local" t)
