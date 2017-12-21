;;; Copyright (C) 2014-2015  Kouhei Sutou <kou@clear-code.com>
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

;;; scss-mode
;; 2014-10-22

(package-ensure-install 'scss-mode)

;; 別の仕組みを使ってコンパイルすることが多いので、
;; 保存時の自動コンパイルは無効にする。
(setq scss-compile-at-save nil)

(add-hook 'scss-mode-hook
          (lambda ()
            ;; インデントにはスペースを使う。
            (setq indent-tabs-mode nil)))
