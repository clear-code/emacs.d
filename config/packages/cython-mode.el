;;; Copyright (C) 2020  Sutou Kouhei <kou@clear-code.com>
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

;;; cython-mode
;;; 2020-10-23

(package-ensure-install 'cython-mode)

(add-hook 'cython-mode-hook
          (lambda ()
            ;; Disable which-function-mode to avoid an infinite loop bug.
            ;;
            ;; See also:
            ;;  * https://github.com/cython/cython/issues/3218
            ;;  * https://github.com/syl20bnr/spacemacs/issues/12740
            ;;
            ;; 2020-10-23
            (which-function-mode -1)))
