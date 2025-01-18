;;; Copyright (C) 2017-2025  Sutou Kouhei <kou@clear-code.com>
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

(use-package ess
  :config
  ;; RStudioと同じスタイルを使う。
  ;; 2019-12-23
  (setq ess-default-style 'RStudio)
  :hook ((ess-mode-hook
          .
          (lambda ()
            ;; _で<-を挿入する機能を無効にする。
            ;; 2019-12-24
            (keymap-set ess-mode-map "_" nil)
            ;; C-c C-iはdeprecatedだしhippie-expandに使っているので無効にする。
            ;; 2019-12-25
            (keymap-set ess-mode-map "C-c C-i" nil)))
         (ess-r-mode-hook
          .
          (lambda ()
            ;; M-?はhelp-for-helpに使っているので無効にする。
            ;; 2020-01-20
            (keymap-set ess-r-mode-map "M-?" nil)))
         (inferior-ess-mode-hook
          .
          (lambda ()
            ;; _で<-を挿入する機能を無効にする。
            ;; 2019-12-24
            (keymap-set inferior-ess-mode-map "_" nil)
            ;; M-?はhelp-for-helpに使っているので無効にする。
            ;; 2019-12-24
            (keymap-set inferior-ess-mode-map "M-?" nil)
            ;; C-c C-iはdeprecatedだしhippie-expandに使っているので無効にする。
            ;; 2019-12-25
            (keymap-set inferior-ess-mode-map "C-c C-i" nil)))))
