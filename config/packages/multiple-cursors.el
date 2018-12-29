;;; Copyright (C) 2012  Kouhei Sutou <kou@clear-code.com>
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

;;; multiple-cursors
;;; 複数箇所を同時に編集する
;;; 2012-12-05

(package-ensure-install 'multiple-cursors)

(define-key global-map (kbd "C-[ M-C-e") 'mc/edit-lines)

(define-key global-map (kbd "<C-right>") 'mc/mark-next-like-this)
(define-key global-map (kbd "<C-left>") 'mc/mark-previous-like-this)
(define-key global-map (kbd "<C-down>") 'mc/mark-all-like-this)
