;;; Copyright (C) 2012-2015  Kouhei Sutou <kou@clear-code.com>
;;; Copyright (C) 2012  yuta yamada <sleepboy.zzz@gmail.com>
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

;;; Magit
;;; 2012-03-23

(package-ensure-install 'magit)

;; コミットメッセージを挿入する
(defun magit-insert-commit-message-from-history ()
  "insert a commit message from history."
  (interactive)
  (let* ((raw-messages-string
          (shell-command-to-string "\\git log -50 --format=\"%x00%B\""))
         (raw-messages (string-to-list (split-string raw-messages-string "\0")))
         (messages (remove-if (lambda (message)
                                (string-equal message ""))
                              (mapcar (lambda (raw-message)
                                        (string-strip raw-message))
                                      raw-messages)))
         (message (completing-read
                   "Insert a commit message from history"
                   messages)))
    (insert message)))

(defun magit-enable-insert-commit-message-from-history ()
  ;; 過去のコミットメッセージを挿入
  (define-key git-commit-mode-map
    (kbd "C-c i") 'magit-insert-commit-message-from-history))
(add-hook 'magit-mode-hook 'magit-enable-insert-commit-message-from-history)

;; diff関連の設定
;; 2012-04-02
(defun magit-setup-diff ()
  ;; diffを表示しているときに文字単位での変更箇所も強調表示する
  ;; 'allではなくtにすると現在選択中のhunkのみ強調表示する
  ;; 2012-04-02
  (setq magit-diff-refine-hunk 'all))
(add-hook 'magit-mode-hook 'magit-setup-diff)

;; push関連の設定
;; 2015-08-17
(defun magit-setup-push ()
  ;; pushするときに確認しない
  ;; pushするときは現在のブランチのみをpushする
  ;; 2015-08-17
  (setq magit-push-always-verify nil))
(add-hook 'magit-mode-hook 'magit-setup-push)
