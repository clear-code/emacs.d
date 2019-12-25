;;; Copyright (C) 2017-2019  Sutou Kouhei <kou@clear-code.com>
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

;;; ESS
;; 2017-05-17

(package-ensure-install 'ess)

;; RStudioと同じスタイルを使う。
;; 2019-12-23
(setq ess-default-style 'RStudio)

(add-hook 'ess-mode-hook
          (lambda ()
            ;; _で<-を挿入する機能を無効にする。
            ;; 2019-12-24
            (define-key ess-mode-map "_" nil)
            (define-key inferior-ess-mode-map "_" nil)
            ;; M-?はhelp-for-helpに使っているので無効にする。
            ;; 2019-12-24
            (define-key ess-mode-map (kbd "M-?") nil)
            (define-key inferior-ess-mode-map (kbd "M-?") nil)
            ;; C-c C-iはdeprecatedだしhippie-expandに使っているので無効にする。
            ;; 2019-12-25
            (define-key ess-mode-map (kbd "C-c C-i") nil)
            (define-key inferior-ess-mode-map (kbd "C-c C-i") nil)))
