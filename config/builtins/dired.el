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

;;; dired

;; バージョン管理システム
;; diredから適切なバージョン管理システムの*-statusを起動
(defun dired-vc-status (&rest args)
  (interactive)
  (let ((path (find-path-in-parents (dired-current-directory)
                                    '(".svn" ".git" ".hg"))))
    (cond ((null path)
           (message "not version controlled."))
          ((string-match-p "\\.svn$" path)
           (svn-status (file-name-directory path)))
          ((string-match-p "\\.git$" path)
           (magit-status (file-name-directory path)))
          ((string-match-p "\\.hg$" path)
           (monky-status (file-name-directory path))))))
(define-key dired-mode-map "V" 'dired-vc-status)

;; グローバルにバインドしているC-M-nとC-M-pを使えるようにする
;; 2014-09-04
(defun dired-disable-move-subdir-key-bindings ()
  (let ((map dired-mode-map))
    (define-key map (kbd "C-M-n") nil)
    (define-key map (kbd "C-M-p") nil)))

(add-hook 'dired-mode-hook
          '(lambda ()
             (dired-disable-move-subdir-key-bindings)))
